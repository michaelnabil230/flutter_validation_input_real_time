import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/text/same.dart';

class ConfirmedPassword extends Rule {
  final String other;

  ConfirmedPassword(
    this.other, {
    super.customError,
  });

  @override
  bool isValid(String value) => Same(other).isValid(value);

  @override
  String error() => 'validation.confirmed_password';
}
