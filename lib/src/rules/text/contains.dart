import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Contains extends Rule {
  final String other;

  Contains(
    this.other, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => value.trim().contains(other);

  @override
  String get name => ValidationNames.isItContains;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [other])
        : customValidationMessage!.call(attribute, [other]);
  }
}
