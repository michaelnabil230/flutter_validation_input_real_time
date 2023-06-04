import 'dart:developer';

import 'package:flutter_validation_input_real_time/src/classes/input.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/text/same.dart';

class ConfirmedPassword extends Rule {
  final String inputName;

  ConfirmedPassword(this.inputName);

  @override
  bool isValid(String value) {
    try {
      Input input = inputs.firstWhere((Input input) => input.name == inputName);

      return Same(input.value).isValid(value);
    } catch (e) {
      log('The input $inputName doesn\'t find in the form widget');
    }

    return false;
  }

  @override
  String toString() => 'validation.confirmed_password';
}
