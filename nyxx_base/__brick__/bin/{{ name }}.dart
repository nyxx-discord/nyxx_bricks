import 'package:nyxx/nyxx.dart';
import 'package:{{name}}/listeners/on_ready.dart';

void main() async {
  final client = NyxxFactory.createNyxxWebsocket(
    '<TOKEN>',
    GatewayIntents.allUnprivileged,
  );

  client
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions());

  // Register listeners, services and setup any extra packages here
  client.onReady.listen(onReady);

  await client.connect();
}
