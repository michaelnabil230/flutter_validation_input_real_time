import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/numbers/min_value.dart';

class RangeValue extends Rule {
  final int min;

  final int max;

  RangeValue({
    required this.min,
    required this.max,
  });

  @override
  bool isValid(String value) {
    int length = getLength(value);

    return length <= max && length >= min;
  }

  @override
  String toString() => 'validation.must_be_range';
}
