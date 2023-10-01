import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Required extends Rule {
  Required({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => value.trim().isNotEmpty;

  @override
  String get name => ValidationNames.required;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
