import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsEnglishChars extends Rule {
  @override
  bool isValid(String value) => isEnglishChars(value);

  @override
  String toString() => 'validation.is_english_chars';
}

bool isEnglishChars(String input) => RegExp(r'^[a-zA-Z]+$').hasMatch(input);
