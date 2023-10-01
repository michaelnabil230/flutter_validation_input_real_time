import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MaxValue extends Rule {
  final int max;

  MaxValue(
    this.max, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) {
    num? val = num.tryParse(value);

    return val != null && val <= max;
  }

  @override
  String get name => ValidationNames.mustBeMax;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [max])
        : customValidationMessage!.call(attribute, [max]);
  }
}
