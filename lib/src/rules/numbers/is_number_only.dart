import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsNumbersOnly extends Rule {
  IsNumbersOnly({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => int.tryParse(value) != null;

  @override
  String get name => ValidationNames.isNumbersOnly;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
