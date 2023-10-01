import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDate extends Rule {
  IsDate({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => DateTime.tryParse(value) != null;

  @override
  String get name => ValidationNames.isNotDateFormat;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
