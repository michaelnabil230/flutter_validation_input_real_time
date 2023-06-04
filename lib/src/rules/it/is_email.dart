import 'package:email_validator/email_validator.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsEmail extends Rule {
  @override
  bool isValid(String value) => EmailValidator.validate(value);

  @override
  String toString() => 'validation.is_not_email_address';
}
