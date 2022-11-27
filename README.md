# nyxx templates

A collection of templates to help users get started with nyxx.

These bricks can be used with the [Mason CLI](https://pub.dev/packages/mason_cli).

### Available bricks
- `nyxx_base`: A bare-bones starter template for nyxx bots
- `nyxx_commands`: A starter template for bots using nyxx_commands
- `nyxx_full`: A complete template for

### Using these bricks
1. Install the [mason CLI](https://pub.dev/packages/mason_cli): `dart pub global activate mason_cli`
2. Install the nyxx bricks
    - Locally (in an existing project): [follow the mason documentation](https://pub.dev/packages/mason_cli#initializing)
    - Globally (anywhere): `mason add -g brick_name --git-url https://github.com/abitofevrything/nyxx_bricks --git path brick_name` where `brick_name` is replaced with the name of the brick you're interested in.
3. Make the brick you installed: `mason make brick_name`
