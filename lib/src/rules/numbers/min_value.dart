import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MinValue extends Rule {
  final int min;

  MinValue(
    this.min, {
    super.customError,
  });

  @override
  bool isValid(String value) {
    num? val = num.tryParse(value);

    return val != null && val >= min;
  }

  @override
  String error() => 'validation.must_be_min';
}
