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
  }) {
    if (withIgnoreValue) {
      ignore = List.of(ignore)..add(text);
    }

    notifyListeners();

    input = input.addError(error).addIgnoreValues(ignore);
    _buttonProvider.check();
  }

  void clearError() {
    notifyListeners();
    input = input.clearError();
  }

  void enable() {
    notifyListeners();
    input = input.copyWith(enabled: true);
  }

  void disable() {
    notifyListeners();
    input = input.copyWith(enabled: false);
  }

  @override
  void clear() {
    super.clear();
    clearError();
  }
}
