import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xterm/xterm.dart';
import '../models/terminal_message.dart';
import '../models/websocket_message.dart';
import '../services/terminal_service.dart';

class TerminalWidget extends StatefulWidget {
  final int serverId;
  final String stackName;
  final String serviceName;
  final String? containerName;
  final VoidCallback? onConnect;
  final void Function(int exitCode)? onDisconnect;
  final void Function(String error)? onError;

  const TerminalWidget({
    super.key,
    required this.serverId,
    required this.stackName,
    required this.serviceName,
    this.containerName,
    this.onConnect,
    this.onDisconnect,
    this.onError,
  });

  @override
  State<TerminalWidget> createState() => _TerminalWidgetState();
}

class _TerminalWidgetState extends State<TerminalWidget> {
  late final Terminal _terminal;
  late final TerminalService _terminalService;
  StreamSubscription<TerminalOutputMessage>? _outputSubscription;
  StreamSubscription<TerminalSession>? _sessionSubscription;
  StreamSubscription<WebSocketConnectionStatus>? _statusSubscription;

  @override
  void initState() {
    super.initState();
    _initializeTerminal();
    _initializeService();
  }

  void _initializeTerminal() {
    _terminal = Terminal(
      maxLines: 1000,
    );

    _terminal.onOutput = (data) {
      if (_terminalService.session.isConnected && _terminalService.session.id.isNotEmpty) {
        _terminalService.sendInput(_terminalService.session.id, Uint8List.fromList(data.codeUnits));
      }
    };

    _terminal.onResize = (width, height, pixelWidth, pixelHeight) {
      if (_terminalService.session.isConnected && _terminalService.session.id.isNotEmpty) {
        _terminalService.resizeTerminal(_terminalService.session.id, width, height);
      }
    };
  }

  void _initializeService() {
    _terminalService = context.read<TerminalService>();
    
    // Subscribe to connection status
    _statusSubscription = _terminalService.connectionStatusStream.listen((status) {
      if (mounted) {
        setState(() {});
      }
    });


    // Auto-connect when widget is created
    _connectAndStart();
  }

  void _setupStreamsAfterConnection() {
    // Subscribe to terminal output - only after connection is established
    _outputSubscription = _terminalService.outputStream?.listen((outputMessage) {
      final outputBytes = outputMessage.outputBytes;
      final outputString = String.fromCharCodes(outputBytes);
      _terminal.write(outputString);
    });

    // Subscribe to session changes
    _sessionSubscription = _terminalService.sessionStream?.listen((session) {
      if (mounted) {
        setState(() {});
        
        if (session.isConnected && session.id.isNotEmpty) {
          widget.onConnect?.call();
        }
        
        // Handle errors from session state
        if (session.error != null && session.error!.isNotEmpty) {
          widget.onError?.call(session.error!);
        }
      }
    });
  }

  Future<void> _connectAndStart() async {
    try {
      final connected = await _terminalService.connect(widget.serverId);
      
      if (connected) {
        // Set up streams after connection is established
        _setupStreamsAfterConnection();
        
        // Small delay to ensure connection is stable
        await Future.delayed(const Duration(milliseconds: 100));
        
        final started = _terminalService.startTerminal(
          stackName: widget.stackName,
          serviceName: widget.serviceName,
          containerName: widget.containerName,
          cols: _terminal.viewWidth,
          rows: _terminal.viewHeight,
        );

        if (!started) {
          widget.onError?.call('Failed to start terminal session');
        }
      } else {
        widget.onError?.call('Failed to connect to server');
      }
    } catch (e) {
      widget.onError?.call('Connection error: $e');
    }
  }

  @override
  void dispose() {
    _outputSubscription?.cancel();
    _sessionSubscription?.cancel();
    _statusSubscription?.cancel();
    
    // Close terminal session if active
    if (_terminalService.session.isConnected && _terminalService.session.id.isNotEmpty) {
      _terminalService.closeTerminal(_terminalService.session.id);
    }
    
    super.dispose();
  }

  Widget _buildStatusIndicator(ThemeData theme) {
    Color statusColor;
    String statusText;
    
    if (_terminalService.connectionStatus == WebSocketConnectionStatus.connected && 
        _terminalService.session.isConnected) {
      statusColor = theme.colorScheme.primary;
      statusText = 'Connected';
    } else if (_terminalService.connectionStatus == WebSocketConnectionStatus.connecting || 
               _terminalService.session.isConnecting) {
      statusColor = theme.colorScheme.secondary;
      statusText = _terminalService.session.isConnecting ? 'Starting session...' : 'Connecting...';
    } else if (_terminalService.connectionStatus == WebSocketConnectionStatus.error) {
      statusColor = theme.colorScheme.error;
      statusText = _terminalService.session.error ?? 'Connection error';
    } else {
      statusColor = theme.colorScheme.outline;
      statusText = 'Disconnected';
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: statusColor,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          statusText,
          style: theme.textTheme.bodySmall?.copyWith(color: statusColor),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outline.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Terminal header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              border: Border(
                bottom: BorderSide(
                  color: theme.colorScheme.outline.withOpacity(0.2),
                ),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        Icons.terminal,
                        size: 16,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        widget.serviceName,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (widget.containerName != null) ...[
                        Text(
                          ':${widget.containerName}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                _buildStatusIndicator(theme),
                const SizedBox(width: 12),
                if (_terminalService.session.isConnected)
                  FilledButton.tonal(
                    onPressed: () {
                      if (_terminalService.session.id.isNotEmpty) {
                        _terminalService.closeTerminal(_terminalService.session.id);
                        widget.onDisconnect?.call(0);
                      }
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(0, 32),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                    ),
                    child: const Text('Disconnect'),
                  ),
              ],
            ),
          ),
          
          // Terminal content
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8),
              child: _terminalService.connectionStatus == WebSocketConnectionStatus.connecting
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(
                            color: theme.colorScheme.primary,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Connecting to ${widget.serviceName}...',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    )
                  : TerminalView(
                      _terminal,
                      theme: TerminalTheme(
                        cursor: theme.colorScheme.primary,
                        selection: theme.colorScheme.primaryContainer,
                        foreground: theme.colorScheme.onSurface,
                        background: Colors.transparent,
                        black: theme.colorScheme.onSurface.withOpacity(0.87),
                        red: Colors.red,
                        green: Colors.green,
                        yellow: Colors.yellow,
                        blue: theme.colorScheme.primary,
                        magenta: Colors.purple,
                        cyan: Colors.cyan,
                        white: theme.colorScheme.onSurface,
                        brightBlack: theme.colorScheme.onSurface.withOpacity(0.6),
                        brightRed: Colors.red.shade300,
                        brightGreen: Colors.green.shade300,
                        brightYellow: Colors.yellow.shade300,
                        brightBlue: theme.colorScheme.primary.withOpacity(0.7),
                        brightMagenta: Colors.purple.shade300,
                        brightCyan: Colors.cyan.shade300,
                        brightWhite: theme.colorScheme.onSurface,
                        searchHitBackground: theme.colorScheme.secondaryContainer,
                        searchHitBackgroundCurrent: theme.colorScheme.secondary,
                        searchHitForeground: theme.colorScheme.onSecondaryContainer,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}