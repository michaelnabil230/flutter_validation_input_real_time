import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

class ValidationTextEditingController extends TextEditingController {
  final BuildContext _context;

  late Input input;

  late InputProvider _inputProvider;

  late ButtonProvider _buttonProvider;

  ValidationTextEditingController({
    required BuildContext context,
    required String attribute,
    required List<Rule> Function() rules,
    bool enabled = true,
    super.text,
  }) : _context = context {
    input = Input(
      key: UniqueKey(),
      attribute: attribute,
      text: text,
      rules: rules,
      enabled: enabled,
    );

    _inputProvider = _context.read<InputProvider>();
    _buttonProvider = _context.read<ButtonProvider>();
  }

  Input get() => _context.watch<InputProvider>().getInput(input);

  @override
  set value(TextEditingValue newValue) {
    input = _inputProvider.runValidation(input, text);

    _buttonProvider.check();

    super.value = newValue;
  }

  void addError(
    String error, {
    bool withIgnoreValue = false,
    List<String> ignore = const [],
  }) =>
      input = _inputProvider.addError(input, error);

  void clearError() => input = _inputProvider.clearError(input);

  void enable() => input = _inputProvider.enable(input);

  void disable() => input = _inputProvider.disable(input);

  @override
  void clear() {
    super.clear();
    clearError();
  }
}
