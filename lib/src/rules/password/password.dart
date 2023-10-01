import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

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
    super.customValidationMessage,
  });

  late String _message;

  late String _error;

  @override
  bool isValid(String value) {
    if (!MinLength(min).isValid(value)) {
      _message = ValidationNames.passwordMin;
      _error = _formatError([min]);
      return false;
    }

    if (lowercase && !Lowercase().isValid(value)) {
      _message = ValidationNames.passwordLowercase;
      _error = _formatError();
      return false;
    }

    if (uppercase && !Uppercase().isValid(value)) {
      _message = ValidationNames.passwordUppercase;
      _error = _formatError();
      return false;
    }

    if (specialCharacters &&
        !RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      _message = ValidationNames.passwordSpecialCharacters;
      _error = _formatError();
      return false;
    }

    if (numbers && !RegExp('[0-9]').hasMatch(value)) {
      _message = ValidationNames.passwordNumbers;
      _error = _formatError();
      return false;
    }

    return true;
  }

  @override
  String get name => _message;

  @override
  String get error => _error;

  String _formatError([List parameters = const []]) {
    return _error = customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute, parameters)
        : customValidationMessage!.call(attribute, parameters);
  }
}
