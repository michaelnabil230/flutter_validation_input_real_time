import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:provider/provider.dart';

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
    bool ignoreThisText = false,
    ValidationState? state,
    super.text,
  }) : _context = context {
    input = Input(
      attribute: attribute,
      text: text,
      rules: rules,
      enabled: enabled,
      state: state,
      ignoreValues: ignoreThisText ? [text] : [],
      status: text.isEmpty ? Status.initial : Status.edit,
    );

    _inputProvider = _context.read<InputProvider>();
    _buttonProvider = _context.read<ButtonProvider>();

    addListener(runValidation);
  }

  void runValidation() {
    input = _inputProvider.runValidation(input, text);

    _buttonProvider.check();
  }

  Input get() => _context.watch<InputProvider>().getInput(input);

  void addError(
    String error, {
    bool withIgnoreValue = false,
    List<String> ignore = const [],
  }) {
    if (withIgnoreValue) {
      ignore = List.of(ignore)..add(text);
    }

    input = _inputProvider.addError(input, error, ignore: ignore);
  }

  void reset() {
    input = _inputProvider.runValidation(input, '');
    notifyListeners();
  }

  void ignoreValues(List<String> values) {
    input = _inputProvider.ignoreValues(input, values);
    notifyListeners();
  }

  void enable() {
    input = _inputProvider.enable(input);
    notifyListeners();
  }

  void disable() {
    input = _inputProvider.disable(input);
    notifyListeners();
  }

  @override
  void clear() {
    super.clear();
    reset();
  }

  @override
  String toString() {
    return 'ValidationTextEditingController(input: $input)';
  }
}
