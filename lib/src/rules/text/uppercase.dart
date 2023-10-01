import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Uppercase extends Rule {
  Uppercase({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => RegExp(r'[A-Z]').hasMatch(value);

  @override
  String get name => ValidationNames.uppercase;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
