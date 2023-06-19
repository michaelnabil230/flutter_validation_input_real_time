import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/button_data.dart';

class ButtonProvider extends ChangeNotifier {
  late ButtonData buttonData = const ButtonData();

  void check() {
    bool passes = buttonData.isEditForm
        ? inputs.any((input) => input.input.isValid)
        : inputs.every((input) => input.input.isValid);

    Map<String, List<String>> errors = {};

    for (final input in inputs) {
      errors.addAll({input.input.attribute: input.input.errors});
    }

    ButtonState state = passes ? ButtonState.enable : ButtonState.disable;

    buttonData = buttonData.copyWith(state: state, errors: errors);
  }

  late List<ValidationTextEditingController> inputs;

  void setInputs(List<ValidationTextEditingController> inputs) =>
      this.inputs = inputs;

  void setButtonData(ButtonData buttonData) => this.buttonData = buttonData;

  void changeState(ButtonState state) {
    buttonData = buttonData.copyWith(state: state);

    notifyListeners();
  }
}
