import 'package:nyxx_commands/nyxx_commands.dart';

final {{ name.camelCase() }} = {{! \
}}{{# type_chat    }}{{> chat.dart   }}{{/ type_chat}}{{! \
}}{{# type_message }}{{> message.dart}}{{/ type_message}}{{! \
}}{{# type_user    }}{{> user.dart   }}{{/ type_user}}