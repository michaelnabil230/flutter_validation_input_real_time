import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/button_data.dart';

class ButtonProvider extends ChangeNotifier {
  late ButtonData buttonData = const ButtonData();

  late List<ValidationTextEditingController> inputs;

  void setInputs(List<ValidationTextEditingController> inputs) =>
      this.inputs = inputs;

  void setButtonData(ButtonData buttonData) => this.buttonData = buttonData;

  void check() {
    bool passes = _isPasses();

    Map<String, List<String>> errors = {
      for (final input in inputs) input.input.attribute: input.input.errors
    };

    ButtonState state = passes ? ButtonState.enable : ButtonState.disable;

    buttonData = buttonData.copyWith(state: state, errors: errors);
  }

  bool _isPasses() {
    if (buttonData.isEditForm) {
      bool noInvalid = !inputs.any((input) => input.input.isInvalid);
      bool anyValid = inputs.any((input) => input.input.isValid);
      bool anyInitial = inputs.any((input) => input.input.isInitial);

      bool noEveryInitial = !inputs.every((input) => input.input.isInitial);

      return noInvalid && (anyValid && anyInitial || noEveryInitial);
    } else {
      return inputs.every((input) => input.input.isValid);
    }
  }

  void changeState(ButtonState state) {
    buttonData = buttonData.copyWith(state: state);

    notifyListeners();
  }
}
