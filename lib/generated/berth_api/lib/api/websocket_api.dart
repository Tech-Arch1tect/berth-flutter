//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of openapi.api;


class WebsocketApi {
  WebsocketApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Per-stack status event stream (WebSocket)
  ///
  /// Upgrades to a WebSocket and pushes container_status and stack_status events for the named stack. The URL is the subscription: the stream is one-directional and any client data frame closes the connection. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<Response> wsApiServersServeridStacksStacknameEventsGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/ws/api/servers/{serverid}/stacks/{stackname}/events'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Per-stack status event stream (WebSocket)
  ///
  /// Upgrades to a WebSocket and pushes container_status and stack_status events for the named stack. The URL is the subscription: the stream is one-directional and any client data frame closes the connection. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<void> wsApiServersServeridStacksStacknameEventsGet(int serverid, String stackname,) async {
    final response = await wsApiServersServeridStacksStacknameEventsGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Operation output stream (WebSocket)
  ///
  /// Upgrades to a WebSocket and pushes the named operation's output as StreamMessage frames (stdout, stderr, progress, complete, error). Requires the same permission that starting the operation required. The stream is one-directional and any client data frame closes the connection. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] operationId (required):
  ///   Operation ID returned by the start-operation endpoint
  Future<Response> wsApiServersServeridStacksStacknameOperationsOperationIdGetWithHttpInfo(int serverid, String stackname, String operationId,) async {
    // ignore: prefer_const_declarations
    final path = r'/ws/api/servers/{serverid}/stacks/{stackname}/operations/{operationId}'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname)
      .replaceAll('{operationId}', operationId);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Operation output stream (WebSocket)
  ///
  /// Upgrades to a WebSocket and pushes the named operation's output as StreamMessage frames (stdout, stderr, progress, complete, error). Requires the same permission that starting the operation required. The stream is one-directional and any client data frame closes the connection. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  ///
  /// * [String] operationId (required):
  ///   Operation ID returned by the start-operation endpoint
  Future<void> wsApiServersServeridStacksStacknameOperationsOperationIdGet(int serverid, String stackname, String operationId,) async {
    final response = await wsApiServersServeridStacksStacknameOperationsOperationIdGetWithHttpInfo(serverid, stackname, operationId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Interactive container terminal (WebSocket)
  ///
  /// Upgrades to a bidirectional WebSocket proxied to a terminal session in one of the stack's containers. The client sends TerminalStartMessage to open a session, then TerminalInputMessage, TerminalResizeMessage and TerminalCloseMessage; the server pushes TerminalSuccessMessage, TerminalOutputMessage, TerminalCloseMessage and TerminalErrorMessage. A terminal_start naming a stack other than the URL's is refused. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<Response> wsApiServersServeridStacksStacknameTerminalGetWithHttpInfo(int serverid, String stackname,) async {
    // ignore: prefer_const_declarations
    final path = r'/ws/api/servers/{serverid}/stacks/{stackname}/terminal'
      .replaceAll('{serverid}', serverid.toString())
      .replaceAll('{stackname}', stackname);

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Interactive container terminal (WebSocket)
  ///
  /// Upgrades to a bidirectional WebSocket proxied to a terminal session in one of the stack's containers. The client sends TerminalStartMessage to open a session, then TerminalInputMessage, TerminalResizeMessage and TerminalCloseMessage; the server pushes TerminalSuccessMessage, TerminalOutputMessage, TerminalCloseMessage and TerminalErrorMessage. A terminal_start naming a stack other than the URL's is refused. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
  ///
  /// Parameters:
  ///
  /// * [int] serverid (required):
  ///   Server ID
  ///
  /// * [String] stackname (required):
  ///   Stack name
  Future<void> wsApiServersServeridStacksStacknameTerminalGet(int serverid, String stackname,) async {
    final response = await wsApiServersServeridStacksStacknameTerminalGetWithHttpInfo(serverid, stackname,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }
}
