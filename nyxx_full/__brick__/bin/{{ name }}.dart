import 'dart:io';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';
import 'package:{{ name }}/commands/ping.dart';
{{# get_it }}import 'package:get_it/get_it.dart';
{{# postgres_database}}import 'package:{{name }}/services/database.dart';{{/ postgres_database }}
{{# lavalink }}import 'package:{{ name }}/services/lavalink.dart';{{/ lavalink}}
{{/ get_it }}
void main() async {
  final client = NyxxFactory.createNyxxWebsocket(
    Platform.environment['TOKEN']!,
    GatewayIntents.allUnprivileged,
  );

  final commands = CommandsPlugin(
    prefix: (_) => Platform.environment['PREFIX']!,
  );

  client
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions())
    ..registerPlugin(commands);

  // Register commands, listeners, services and setup any extra packages here
  commands.addCommand(ping);

  await client.connect();
{{# get_it }}
  GetIt.I.registerSingleton(client);
  GetIt.I.registerSingleton(commands);
  {{# postgres_database }}GetIt.I.registerSingleton(await Database.connect());{{/ postgres_database }}
  {{# lavalink}}GetIt.I.registerSingleton(await Lavalink.connect(client));{{/ lavalink }}
{{/ get_it }}
}
