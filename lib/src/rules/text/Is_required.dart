import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsRequired extends Rule {
  @override
  bool isValid(String value) => value.trim().isNotEmpty;

  @override
  String toString() => 'validation.required';
}
