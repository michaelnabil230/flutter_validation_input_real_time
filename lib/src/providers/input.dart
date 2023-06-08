import 'package:flutter/cupertino.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

class InputProvider extends ChangeNotifier {
  final List<Input> inputs = [];

  void register(Input input) {
    try {
      inputs.firstWhere(_where(input.attribute));
    } catch (e) {
      inputs.add(input);
    }
  }

  void unregister(String attribute) => inputs.removeWhere(_where(attribute));

  void addError(
    String attribute,
    String error, {
    List<String> ignore = const [],
  }) {
    Input newInput =
        getInput(attribute).addError(error).addIgnoreValues(ignore);

    _updateInput(newInput);
  }

  void clearError(String attribute) {
    Input newInput = getInput(attribute).clearError();

    _updateInput(newInput);
  }

  void runValidation(String attribute, String text) {
    Input newInput = getInput(attribute).runValidation(text);

    _updateInput(newInput);
  }

  void _updateInput(Input newInput) {
    int index = inputs.indexWhere(_where(newInput.attribute));
    inputs[index] = newInput;

    notifyListeners();
  }

  Input getInput(String attribute) {
    try {
      return inputs.firstWhere(_where(attribute));
    } catch (e) {
      throw Exception('This $attribute input is not initialized in the widget');
    }
  }

  bool Function(Input input) _where(String attribute) =>
      (Input input) => input.attribute == attribute;
}
