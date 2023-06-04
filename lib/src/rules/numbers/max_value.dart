import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MaxValue extends Rule {
  final int max;

  MaxValue(this.max);

  @override
  bool isValid(String value) {
    num? val = num.tryParse(value);

    return val != null && val <= max;
  }

  @override
  String toString() => 'validation.must_be_max';
}
