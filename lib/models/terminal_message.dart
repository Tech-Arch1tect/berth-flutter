import 'dart:convert';
import 'dart:typed_data';
import 'package:json_annotation/json_annotation.dart';

part 'terminal_message.g.dart';

@JsonSerializable()
class TerminalSession {
  final String id;
  final bool isConnected;
  final bool isConnecting;
  final int serverId;
  final String stackName;
  final String serviceName;
  final String? containerName;
  final String? error;

  const TerminalSession({
    required this.id,
    required this.isConnected,
    required this.isConnecting,
    required this.serverId,
    required this.stackName,
    required this.serviceName,
    this.containerName,
    this.error,
  });

  factory TerminalSession.fromJson(Map<String, dynamic> json) =>
      _$TerminalSessionFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalSessionToJson(this);

  TerminalSession copyWith({
    String? id,
    bool? isConnected,
    bool? isConnecting,
    int? serverId,
    String? stackName,
    String? serviceName,
    String? containerName,
    String? error,
  }) {
    return TerminalSession(
      id: id ?? this.id,
      isConnected: isConnected ?? this.isConnected,
      isConnecting: isConnecting ?? this.isConnecting,
      serverId: serverId ?? this.serverId,
      stackName: stackName ?? this.stackName,
      serviceName: serviceName ?? this.serviceName,
      containerName: containerName ?? this.containerName,
      error: error ?? this.error,
    );
  }
}

abstract class TerminalMessage {
  static const String terminalStart = 'terminal_start';
  static const String terminalInput = 'terminal_input';
  static const String terminalOutput = 'terminal_output';
  static const String terminalResize = 'terminal_resize';
  static const String terminalClose = 'terminal_close';
  static const String success = 'success';
  static const String error = 'error';
}

@JsonSerializable()
class TerminalStartMessage {
  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'stack_name')
  final String stackName;

  @JsonKey(name: 'service_name')
  final String serviceName;

  @JsonKey(name: 'container_name')
  final String? containerName;

  final int cols;
  final int rows;

  const TerminalStartMessage({
    this.type = TerminalMessage.terminalStart,
    required this.stackName,
    required this.serviceName,
    this.containerName,
    required this.cols,
    required this.rows,
  });

  factory TerminalStartMessage.fromJson(Map<String, dynamic> json) =>
      _$TerminalStartMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalStartMessageToJson(this);
}

@JsonSerializable()
class TerminalInputMessage {
  @JsonKey(name: 'type')
  final String type;

  final String timestamp;

  @JsonKey(name: 'session_id')
  final String sessionId;

  final List<int> input;

  const TerminalInputMessage({
    this.type = TerminalMessage.terminalInput,
    required this.sessionId,
    required this.input,
    required this.timestamp,
  });

  factory TerminalInputMessage.fromJson(Map<String, dynamic> json) =>
      _$TerminalInputMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalInputMessageToJson(this);
}

@JsonSerializable()
class TerminalOutputMessage {
  @JsonKey(name: 'type')
  final String type;

  final String timestamp;

  @JsonKey(name: 'session_id')
  final String sessionId;

  final dynamic output; // Can be String (base64) or List<int>

  const TerminalOutputMessage({
    required this.type,
    required this.timestamp,
    required this.sessionId,
    required this.output,
  });

  factory TerminalOutputMessage.fromJson(Map<String, dynamic> json) =>
      _$TerminalOutputMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalOutputMessageToJson(this);

  Uint8List get outputBytes {
    if (output is String) {
      // Always expect base64 encoding for string output
      final base64String = output as String;
      try {
        final decodedBytes = base64Decode(base64String);
        return Uint8List.fromList(decodedBytes);
      } catch (e) {
        // Fallback to empty bytes on decode error
        return Uint8List(0);
      }
    } else if (output is List) {
      // Array of numbers (fallback)
      return Uint8List.fromList((output as List).cast<int>());
    }
    return Uint8List(0);
  }
}

@JsonSerializable()
class TerminalResizeMessage {
  @JsonKey(name: 'type')
  final String type;

  final String timestamp;

  @JsonKey(name: 'session_id')
  final String sessionId;

  final int cols;
  final int rows;

  const TerminalResizeMessage({
    this.type = TerminalMessage.terminalResize,
    required this.sessionId,
    required this.cols,
    required this.rows,
    required this.timestamp,
  });

  factory TerminalResizeMessage.fromJson(Map<String, dynamic> json) =>
      _$TerminalResizeMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalResizeMessageToJson(this);
}

@JsonSerializable()
class TerminalCloseMessage {
  @JsonKey(name: 'type')
  final String type;

  final String timestamp;

  @JsonKey(name: 'session_id')
  final String sessionId;

  @JsonKey(name: 'exit_code')
  final int exitCode;

  const TerminalCloseMessage({
    this.type = TerminalMessage.terminalClose,
    required this.sessionId,
    this.exitCode = 0,
    required this.timestamp,
  });

  factory TerminalCloseMessage.fromJson(Map<String, dynamic> json) =>
      _$TerminalCloseMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalCloseMessageToJson(this);
}

@JsonSerializable()
class TerminalSuccessMessage {
  @JsonKey(name: 'type')
  final String type;

  final String message;

  @JsonKey(name: 'session_id')
  final String sessionId;

  final String timestamp;

  const TerminalSuccessMessage({
    required this.type,
    required this.message,
    required this.sessionId,
    required this.timestamp,
  });

  factory TerminalSuccessMessage.fromJson(Map<String, dynamic> json) =>
      _$TerminalSuccessMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalSuccessMessageToJson(this);
}

@JsonSerializable()
class TerminalErrorMessage {
  @JsonKey(name: 'type')
  final String type;

  final String error;
  final String? context;
  final String timestamp;

  const TerminalErrorMessage({
    required this.type,
    required this.error,
    this.context,
    required this.timestamp,
  });

  factory TerminalErrorMessage.fromJson(Map<String, dynamic> json) =>
      _$TerminalErrorMessageFromJson(json);

  Map<String, dynamic> toJson() => _$TerminalErrorMessageToJson(this);
}