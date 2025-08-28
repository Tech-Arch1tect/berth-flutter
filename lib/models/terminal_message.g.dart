// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terminal_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TerminalSession _$TerminalSessionFromJson(Map<String, dynamic> json) =>
    TerminalSession(
      id: json['id'] as String,
      isConnected: json['isConnected'] as bool,
      isConnecting: json['isConnecting'] as bool,
      serverId: (json['serverId'] as num).toInt(),
      stackName: json['stackName'] as String,
      serviceName: json['serviceName'] as String,
      containerName: json['containerName'] as String?,
      error: json['error'] as String?,
    );

Map<String, dynamic> _$TerminalSessionToJson(TerminalSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isConnected': instance.isConnected,
      'isConnecting': instance.isConnecting,
      'serverId': instance.serverId,
      'stackName': instance.stackName,
      'serviceName': instance.serviceName,
      'containerName': instance.containerName,
      'error': instance.error,
    };

TerminalStartMessage _$TerminalStartMessageFromJson(
  Map<String, dynamic> json,
) => TerminalStartMessage(
  type: json['type'] as String? ?? TerminalMessage.terminalStart,
  stackName: json['stack_name'] as String,
  serviceName: json['service_name'] as String,
  containerName: json['container_name'] as String?,
  cols: (json['cols'] as num).toInt(),
  rows: (json['rows'] as num).toInt(),
);

Map<String, dynamic> _$TerminalStartMessageToJson(
  TerminalStartMessage instance,
) => <String, dynamic>{
  'type': instance.type,
  'stack_name': instance.stackName,
  'service_name': instance.serviceName,
  'container_name': instance.containerName,
  'cols': instance.cols,
  'rows': instance.rows,
};

TerminalInputMessage _$TerminalInputMessageFromJson(
  Map<String, dynamic> json,
) => TerminalInputMessage(
  type: json['type'] as String? ?? TerminalMessage.terminalInput,
  sessionId: json['session_id'] as String,
  input: (json['input'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$TerminalInputMessageToJson(
  TerminalInputMessage instance,
) => <String, dynamic>{
  'type': instance.type,
  'timestamp': instance.timestamp,
  'session_id': instance.sessionId,
  'input': instance.input,
};

TerminalOutputMessage _$TerminalOutputMessageFromJson(
  Map<String, dynamic> json,
) => TerminalOutputMessage(
  type: json['type'] as String,
  timestamp: json['timestamp'] as String,
  sessionId: json['session_id'] as String,
  output: json['output'],
);

Map<String, dynamic> _$TerminalOutputMessageToJson(
  TerminalOutputMessage instance,
) => <String, dynamic>{
  'type': instance.type,
  'timestamp': instance.timestamp,
  'session_id': instance.sessionId,
  'output': instance.output,
};

TerminalResizeMessage _$TerminalResizeMessageFromJson(
  Map<String, dynamic> json,
) => TerminalResizeMessage(
  type: json['type'] as String? ?? TerminalMessage.terminalResize,
  sessionId: json['session_id'] as String,
  cols: (json['cols'] as num).toInt(),
  rows: (json['rows'] as num).toInt(),
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$TerminalResizeMessageToJson(
  TerminalResizeMessage instance,
) => <String, dynamic>{
  'type': instance.type,
  'timestamp': instance.timestamp,
  'session_id': instance.sessionId,
  'cols': instance.cols,
  'rows': instance.rows,
};

TerminalCloseMessage _$TerminalCloseMessageFromJson(
  Map<String, dynamic> json,
) => TerminalCloseMessage(
  type: json['type'] as String? ?? TerminalMessage.terminalClose,
  sessionId: json['session_id'] as String,
  exitCode: (json['exit_code'] as num?)?.toInt() ?? 0,
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$TerminalCloseMessageToJson(
  TerminalCloseMessage instance,
) => <String, dynamic>{
  'type': instance.type,
  'timestamp': instance.timestamp,
  'session_id': instance.sessionId,
  'exit_code': instance.exitCode,
};

TerminalSuccessMessage _$TerminalSuccessMessageFromJson(
  Map<String, dynamic> json,
) => TerminalSuccessMessage(
  type: json['type'] as String,
  message: json['message'] as String,
  sessionId: json['session_id'] as String,
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$TerminalSuccessMessageToJson(
  TerminalSuccessMessage instance,
) => <String, dynamic>{
  'type': instance.type,
  'message': instance.message,
  'session_id': instance.sessionId,
  'timestamp': instance.timestamp,
};

TerminalErrorMessage _$TerminalErrorMessageFromJson(
  Map<String, dynamic> json,
) => TerminalErrorMessage(
  type: json['type'] as String,
  error: json['error'] as String,
  context: json['context'] as String?,
  timestamp: json['timestamp'] as String,
);

Map<String, dynamic> _$TerminalErrorMessageToJson(
  TerminalErrorMessage instance,
) => <String, dynamic>{
  'type': instance.type,
  'error': instance.error,
  'context': instance.context,
  'timestamp': instance.timestamp,
};
