import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsEmpty extends Rule {
  IsEmpty({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => value.trim().isEmpty;

  @override
  String get name => ValidationNames.isEmpty;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
