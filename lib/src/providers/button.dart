import 'package:flutter/material.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/button_form_data.dart';

class ButtonProvider extends ChangeNotifier {
  late ButtonFromData buttonFromData = const ButtonFromData();

  void check(List<Input> inputs) {
    bool passes = buttonFromData.isEditForm
        ? inputs.any((e) => e.isValid)
        : inputs.every((e) => e.isValid);

    buttonFromData = buttonFromData.copyWith(passes: passes);
  }

  void setButtonData(ButtonFromData buttonFromData) =>
      this.buttonFromData = buttonFromData;

  void isLoading(bool isLoading) {
    buttonFromData = buttonFromData.copyWith(isLoading: isLoading);

    notifyListeners();
  }
}
