FROM dart:stable

WORKDIR /bot

# Install dependencies
COPY pubspec.* /bot/
RUN dart pub get

# Copy code
COPY . /bot/
RUN dart pub get --offline

# Compile bot into executable
RUN dart run nyxx_commands:compile --compile -o {{ name }}.g.dart --no-compile bin/{{ name }}.dart
RUN dart compile exe -o {{ name }} {{ name }}.g.dart

CMD [ "./{{ name }}" ]
