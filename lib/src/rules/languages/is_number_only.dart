import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsNumbersOnly extends Rule {
  @override
  bool isValid(String value) => isNumbersOnly(value);

  @override
  String toString() => 'validation.is_numbers_only';
}

bool isNumbersOnly(String input) => RegExp('[0-9]').hasMatch(input);
