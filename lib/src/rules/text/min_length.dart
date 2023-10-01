import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MinLength extends Rule {
  final int min;

  MinLength(
    this.min, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => value.trim().length >= min;

  @override
  String get name => ValidationNames.min;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [min])
        : customValidationMessage!.call(attribute, [min]);
  }
}
