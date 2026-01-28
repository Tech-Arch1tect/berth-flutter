import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:berth_api/api.dart' as berth_api;
import '../services/terminal_service.dart';
import 'terminal_widget.dart';

class TerminalModal extends StatelessWidget {
  final berth_api.ServerResponse server;
  final berth_api.Stack stack;
  final String serviceName;
  final String? containerName;

  const TerminalModal({
    super.key,
    required this.server,
    required this.stack,
    required this.serviceName,
    this.containerName,
  });

  static Future<void> show({
    required BuildContext context,
    required berth_api.ServerResponse server,
    required berth_api.Stack stack,
    required String serviceName,
    String? containerName,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (context) => TerminalModal(
        server: server,
        stack: stack,
        serviceName: serviceName,
        containerName: containerName,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final terminalService = TerminalService(context.read(), context.read());

    return Provider<TerminalService>.value(
      value: terminalService,
      child: Dialog.fullscreen(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Icon(
                  Icons.terminal,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        serviceName,
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${stack.name} • ${server.name}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            leading: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                terminalService.disconnect();
                Navigator.of(context).pop();
              },
            ),
            backgroundColor: theme.colorScheme.surface,
            surfaceTintColor: Colors.transparent,
          ),
          body: Container(
            color: theme.colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: TerminalWidget(
                serverId: server.id,
                stackName: stack.name,
                serviceName: serviceName,
                containerName: containerName,
                onConnect: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Terminal session started'),
                      backgroundColor: theme.colorScheme.primary,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                onDisconnect: (exitCode) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        exitCode != 0
                            ? 'Terminal session ended (exit code: $exitCode)'
                            : 'Terminal session disconnected',
                      ),
                      backgroundColor: theme.colorScheme.error,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                onError: (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Terminal error: $error'),
                      backgroundColor: theme.colorScheme.error,
                      behavior: SnackBarBehavior.floating,
                      action: SnackBarAction(
                        label: 'Dismiss',
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}