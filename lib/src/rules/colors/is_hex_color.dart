import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsHexColor extends Rule {
  IsHexColor({
    super.customError,
  });

  @override
  bool isValid(String value) {
    return (RegExp(r'^#?([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$').hasMatch(value) ||
        RegExp(r'^#?([A-Fa-f0-9]{8}|[A-Fa-f0-9]{3})$').hasMatch(value));
  }

  @override
  String error() => 'validation.must_be_hex_color';
}
