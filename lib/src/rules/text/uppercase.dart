import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Uppercase extends Rule {
  @override
  bool isValid(String value) => RegExp(r'[A-Z]').hasMatch(value);

  @override
  String toString() => 'validation.uppercase';
}
