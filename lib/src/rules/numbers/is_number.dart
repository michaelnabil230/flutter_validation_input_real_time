import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsNumber extends Rule {
  @override
  bool isValid(String value) => isNumber(value);

  @override
  String toString() => 'validation.must_be_int';
}

bool isNumber(String? input) => num.tryParse(input ?? '') != null;
