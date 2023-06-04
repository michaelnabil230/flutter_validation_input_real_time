import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsEmpty extends Rule {
  @override
  bool isValid(String value) => isEmpty(value);

  @override
  String toString() => 'validation.is_empty';
}

bool isEmpty(String? input) {
  return input?.trim().isEmpty ?? true;
}
