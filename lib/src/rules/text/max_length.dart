import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MaxLength extends Rule {
  final int max;

  MaxLength(this.max);

  @override
  bool isValid(String value) => value.trim().length <= max;

  @override
  String toString() => 'validation.max length is $max';
}
