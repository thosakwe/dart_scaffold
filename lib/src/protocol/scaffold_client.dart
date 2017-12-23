import 'dart:async';
import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;
import 'package:stream_channel/stream_channel.dart';
import '../models/models.dart';

class ScaffoldClient {
  final json_rpc.Client client;

  ScaffoldClient(StreamChannel channel) : client = new json_rpc.Client(channel);

  Future<List<Prompt>> getPrompts() {
    return client
        .sendRequest('prompts')
        .then((res) => res.map(Prompt.parse).toList());
  }
}
