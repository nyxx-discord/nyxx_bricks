import 'package:nyxx/nyxx.dart';
import 'package:nyxx_commands/nyxx_commands.dart';

final ping = ChatCommand(
  'ping',
  'Ping the bot',
  id('ping', (IChatContext context) async {
    await context.respond(MessageBuilder.content('Pong!'));
  }),
);
