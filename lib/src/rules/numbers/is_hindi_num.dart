import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsHindiNum extends Rule {
  @override
  bool isValid(String value) => isHindiNum(value);

  @override
  String toString() => 'validation.must_be_num';
}

bool isHindiNum(String input) {
  return RegExp('^[\u0661-\u0669][\u0660-\u0669]*\$').hasMatch(input);
}
