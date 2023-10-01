import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/text/same.dart';

class ConfirmedPassword extends Rule {
  final String other;

  ConfirmedPassword(
    this.other, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => Same(other).isValid(value);

  @override
  String get name => ValidationNames.confirmedPassword;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
