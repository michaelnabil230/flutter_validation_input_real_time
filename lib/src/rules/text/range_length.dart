import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class RangeLength extends Rule {
  final int min;

  final int max;

  RangeLength({
    required this.min,
    required this.max,
  });

  @override
  bool isValid(String value) {
    int length = value.trim().length;

    return length <= max && length >= min;
  }

  @override
  String toString() => 'validation.must_be_range';
}
