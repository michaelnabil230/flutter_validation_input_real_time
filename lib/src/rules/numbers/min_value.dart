import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MinValue extends Rule {
  final int min;

  MinValue(
    this.min, {
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) {
    num? val = num.tryParse(value);

    return val != null && val >= min;
  }

  @override
  String get name => ValidationNames.mustBeMin;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, [min])
        : customValidationMessage!.call(attribute, [min]);
  }
}
