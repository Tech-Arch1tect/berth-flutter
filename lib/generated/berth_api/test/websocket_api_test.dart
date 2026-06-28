//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.18

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

import 'package:berth_api/api.dart';
import 'package:test/test.dart';


/// tests for WebsocketApi
void main() {
  // final instance = WebsocketApi();

  group('tests for WebsocketApi', () {
    // Per-stack status event stream (WebSocket)
    //
    // Upgrades to a WebSocket and pushes container_status and stack_status events for the named stack. The URL is the subscription: the stream is one-directional and any client data frame closes the connection. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
    //
    //Future wsApiServersServeridStacksStacknameEventsGet(int serverid, String stackname) async
    test('test wsApiServersServeridStacksStacknameEventsGet', () async {
      // TODO
    });

    // Operation output stream (WebSocket)
    //
    // Upgrades to a WebSocket and pushes the named operation's output as StreamMessage frames (stdout, stderr, progress, complete, error). Requires the same permission that starting the operation required. The stream is one-directional and any client data frame closes the connection. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
    //
    //Future wsApiServersServeridStacksStacknameOperationsOperationIdGet(int serverid, String stackname, String operationId) async
    test('test wsApiServersServeridStacksStacknameOperationsOperationIdGet', () async {
      // TODO
    });

    // Interactive container terminal (WebSocket)
    //
    // Upgrades to a bidirectional WebSocket proxied to a terminal session in one of the stack's containers. The client sends TerminalStartMessage to open a session, then TerminalInputMessage, TerminalResizeMessage and TerminalCloseMessage; the server pushes TerminalSuccessMessage, TerminalOutputMessage, TerminalCloseMessage and TerminalErrorMessage. A terminal_start naming a stack other than the URL's is refused. Authenticate with an Authorization Bearer header or the Bearer WebSocket subprotocol.
    //
    //Future wsApiServersServeridStacksStacknameTerminalGet(int serverid, String stackname) async
    test('test wsApiServersServeridStacksStacknameTerminalGet', () async {
      // TODO
    });

  });
}
