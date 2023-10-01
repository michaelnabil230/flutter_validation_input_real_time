import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MaxLength extends Rule {
  final int max;

  MaxLength(
    this.max, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => value.trim().length <= max;

  @override
  String get name => ValidationNames.max;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [max])
        : customValidationMessage!.call(attribute, [max]);
  }
}
