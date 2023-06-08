import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/button_form_data.dart';

class ButtonProvider extends ChangeNotifier {
  late ButtonFormData buttonFormData = const ButtonFormData();

  void check(List<Input> inputs) {
    bool passes = buttonFormData.isEditForm
        ? inputs.any((e) => e.isValid)
        : inputs.every((e) => e.isValid);

    Map<String, List<String>> errors = {};

    for (final input in inputs) {
      errors.addAll({input.attribute: input.errors});
    }

    buttonFormData = buttonFormData.copyWith(
      passes: passes,
      errors: errors,
    );
  }

  void setButtonData(ButtonFormData buttonFormData) =>
      this.buttonFormData = buttonFormData;

  void isLoading(bool isLoading) {
    buttonFormData = buttonFormData.copyWith(isLoading: isLoading);

    notifyListeners();
  }
}
