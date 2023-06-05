import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Password extends Rule {
  final int min;

  final bool lowercase;

  final bool uppercase;

  final bool numbers;

  final bool specialCharacters;

  Password({
    this.min = 8,
    this.lowercase = false,
    this.uppercase = false,
    this.numbers = false,
    this.specialCharacters = false,
    super.customError,
  });

  late String _message;

  @override
  bool isValid(String value) {
    if (!MinLength(min).isValid(value)) {
      _message = 'min';
      return false;
    }

    if (lowercase && !Lowercase().isValid(value)) {
      _message = 'lowercase';
      return false;
    }

    if (uppercase && !Uppercase().isValid(value)) {
      _message = 'uppercase';
      return false;
    }

    if (specialCharacters &&
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      _message = 'special_characters';
      return false;
    }

    if (numbers && !RegExp('[0-9]').hasMatch(value)) {
      _message = 'numbers';
      return false;
    }

    return true;
  }

  @override
  String error() => 'validation.password.$_message';
}
