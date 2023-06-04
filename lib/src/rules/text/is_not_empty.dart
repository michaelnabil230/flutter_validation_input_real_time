import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsRequired extends Rule {
  @override
  bool isValid(String value) => isNotEmpty(value);

  @override
  String toString() => 'validation.required';
}

bool isNotEmpty(String? string) {
  return string?.trim().isNotEmpty ?? false;
}
