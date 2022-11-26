import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';
import 'package:{{ name }}/commands/ping.dart';

void main() async {
  final client = NyxxFactory.createNyxxWebsocket(
    '<TOKEN>',
    GatewayIntents.allUnprivileged,
  );

  final commands = CommandsPlugin(
    prefix: {{#mentionable}}mentionOr({{/mentionable}}(_) => '{{ prefix }}'{{#mentionable}}){{/mentionable}},
  );

  client
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions())
    ..registerPlugin(commands);

  // Register commands, listeners, services and setup any extra packages here
  commands.addCommand(ping);

  await client.connect();
}
