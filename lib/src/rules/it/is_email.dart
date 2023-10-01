import 'package:email_validator/email_validator.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsEmail extends Rule {
  IsEmail({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => EmailValidator.validate(value);

  @override
  String get name => ValidationNames.isNotEmailAddress;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
