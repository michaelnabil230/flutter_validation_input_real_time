import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ValidationTextEditingController extends TextEditingController {
  final BuildContext context;

  late Input input;

  late InputProvider inputProvider;

  late ButtonProvider buttonProvider;

  ValidationTextEditingController({
    required this.context,
    required String attribute,
    required List<Rule> Function() rules,
    bool enabled = true,
    super.text,
  }) {
    input =
        Input(attribute: attribute, text: text, rules: rules, enabled: enabled);

    inputProvider = context.read<InputProvider>()..register(input);
    buttonProvider = context.read<ButtonProvider>();

    addListener(() {
      inputProvider.runValidation(attribute, text);

      buttonProvider.check(inputProvider.inputs);
    });
  }

  Input get() => context.watch<InputProvider>().getInput(input.attribute);

  void addError(
    String error, {
    bool withIgnoreValue = false,
    List<String> ignore = const [],
  }) {
    if (withIgnoreValue) {
      ignore = List.of(ignore)..add(text);
    }

    inputProvider.addError(
      input.attribute,
      error,
      ignore: ignore,
    );
    buttonProvider.check(inputProvider.inputs);
  }

  void clearError() => inputProvider.clearError(input.attribute);

  @override
  void clear() {
    super.clear();
    clearError();
  }

  @override
  void dispose() {
    super.dispose();
    inputProvider.unregister(input.attribute);
  }
}
