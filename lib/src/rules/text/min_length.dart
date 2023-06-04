import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MinLength extends Rule {
  final int min;

  MinLength(this.min);

  @override
  bool isValid(String value) => value.trim().length >= min;

  @override
  String toString() => 'validation.min length is $min';
}

bool minLength(String? input, int min) {
  if (input == null) return false;
  return input.trim().length >= min;
}
