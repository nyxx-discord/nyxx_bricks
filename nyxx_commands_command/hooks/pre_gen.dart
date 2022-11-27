import 'dart:io';

import 'package:mason/mason.dart';
import 'package:path/path.dart' as path;

final prefix = styleBold.wrap(lightGreen.wrap('?'));

void run(HookContext context) async {
  // Convert selected command type to a series of boolean variables we can test for
  final typeFlags = {
    for (final type in ['chat', 'chat_slash', 'chat_message', 'message', 'user'])
      'type_$type': false,
  };

  typeFlags['type_${context.vars['command_type']}'] = true;
  typeFlags['type_chat'] =
      typeFlags['type_chat']! || typeFlags['type_chat_slash']! || typeFlags['type_chat_message']!;
  context.vars.addAll(typeFlags);

  final includeOptions = context.vars['chat_include_options'] =
      typeFlags['type_chat_slash']! || typeFlags['type_chat_message']!;
  if (includeOptions) {
    context.vars['chat_command_type'] = typeFlags['type_chat_slash']! ? 'slashOnly' : 'chatOnly';
  }

  context.vars['out_path'] = '';
  final files = await Directory.current.list().map((file) => path.basename(file.path)).toList();

  if (files.contains('pubspec.yaml') && files.contains('lib')) {
    context.vars['out_path'] = 'lib/commands/';
  }
}
