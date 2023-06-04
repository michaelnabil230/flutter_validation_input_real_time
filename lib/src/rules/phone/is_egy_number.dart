import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsEgyptianPhone extends Rule {
  @override
  bool isValid(String value) => isEgyptianNumber(value);

  @override
  String toString() => 'validation.is_egyptian_num';
}

bool isEgyptianNumber(String value) =>
    RegExp('^01[0125][0-9]{8}\$').hasMatch(value);
