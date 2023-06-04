import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsNumbersOnly extends Rule {
  @override
  bool isValid(String value) => RegExp('[0-9]').hasMatch(value);

  @override
  String toString() => 'validation.is_numbers_only';
}
