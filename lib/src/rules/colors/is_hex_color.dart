import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsHexColor extends Rule {
  @override
  bool isValid(String value) => isHexColor(value);

  @override
  String toString() => 'validation.must_be_hex_color';
}

bool isHexColor(String input) =>
    (RegExp(r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$').hasMatch(input) ||
        RegExp(r'^#?([A-Fa-f0-9]{8}|[A-Fa-f0-9]{3})$').hasMatch(input));
