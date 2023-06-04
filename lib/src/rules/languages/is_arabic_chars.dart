import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsArabicChars extends Rule {
  @override
  bool isValid(String value) => isArabicChars(value);

  @override
  String toString() => 'validation.is_arabic_chars';
}

bool isArabicChars(String input) =>
    RegExp(r'^[\u0621-\u064A\s\p{N}]+$').hasMatch(input);
