import 'dart:isolate';
import 'package:async/async.dart';
import 'package:scaffold/scaffold.dart';
import 'package:stream_channel/stream_channel.dart';

main() async {
  var recv = new ReceivePort();
  var queue = new StreamQueue(recv);
  await Isolate.spawn(pluginMain, recv.sendPort);
  queue.next.then((SendPort sendPort) async {
    var channel = new StreamChannelController();
    queue.rest.pipe(channel.local.sink);
    channel.local.stream
        .listen((data) => sendPort.send(data), onDone: recv.close);
    var client = new ScaffoldClient(channel.foreign);
    var prompts = await client.getPrompts();
    print(prompts);
  });
}

pluginMain(SendPort sendPort) {
  var recv = new ReceivePort();
  sendPort.send(recv.sendPort);
  var channel = new IsolateChannel(recv, sendPort);
  var scaffold = new ExampleScaffold();
  return scaffold.run(channel);
}

class ExampleScaffold extends Scaffold {
  @override
  List<Prompt> get prompts {
    return [
      new Prompt(
          name: 'name', description: 'Your name hahaha', defaultsTo: 'foo'),
    ];
  }
}
