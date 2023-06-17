import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/button_form_data.dart';

class ButtonProvider extends ChangeNotifier {
  late ButtonFormData buttonFormData = const ButtonFormData();

  void check() {
    bool passes = buttonFormData.isEditForm
        ? inputs.any((input) => input.input.isValid)
        : inputs.every((input) => input.input.isValid);

    Map<String, List<String>> errors = {};

    for (final input in inputs) {
      errors.addAll({input.input.attribute: input.input.errors});
    }

    buttonFormData = buttonFormData.copyWith(passes: passes, errors: errors);
  }

  late List<ValidationTextEditingController> inputs;

  void setInputs(List<ValidationTextEditingController> inputs) =>
      this.inputs = inputs;

  void setButtonData(ButtonFormData buttonFormData) =>
      this.buttonFormData = buttonFormData;

  void isLoading(bool isLoading) {
    buttonFormData = buttonFormData.copyWith(isLoading: isLoading);

    notifyListeners();
  }
}
