import 'package:flutter_validation_input_real_time/src/rules/rule.dart';
import 'package:flutter_validation_input_real_time/src/rules/numbers/min_value.dart';

class MaxValue extends Rule {
  final int max;

  MaxValue(this.max);

  @override
  bool isValid(String value) => getLength(value) <= max;

  @override
  String toString() => 'validation.must_be_max';
}
