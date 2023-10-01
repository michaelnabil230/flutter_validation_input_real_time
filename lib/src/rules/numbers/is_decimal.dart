import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDecimal extends Rule {
  IsDecimal({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => double.tryParse(value) != null;

  @override
  String get name => ValidationNames.isDecimal;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
