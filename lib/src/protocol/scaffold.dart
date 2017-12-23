import 'dart:async';
import 'package:json_rpc_2/json_rpc_2.dart' as json_rpc;
import 'package:stream_channel/stream_channel.dart';
import '../models/models.dart';

abstract class Scaffold {
  List<Prompt> get prompts;

  Future run(StreamChannel channel) {
    var server = new json_rpc.Server(channel);

    server.registerMethod('prompts', () => prompts);

    server.registerMethod('done', () {
      new Timer.periodic(const Duration(seconds: 1), (_) => server.close());
      return true;
    });

    return server.listen();
  }
}
