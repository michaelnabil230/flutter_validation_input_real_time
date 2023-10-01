import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsUserName extends Rule {
  IsUserName({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => RegExp(r'^[a-zA-Z0-9_]{3,16}$').hasMatch(value);

  @override
  String get name => ValidationNames.username;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
