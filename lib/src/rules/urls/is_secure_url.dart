import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsSecureUrl extends Rule {
  @override
  bool isValid(String value) => isSecureUrl(value);

  @override
  String toString() => 'validation.is_not_secure_url';
}

// returns true if the input is valid port number
bool isSecureUrl(Object? input) {
  String? url;
  if (input == null) {
    return false;
  } else if (input is String) {
    url = input.toLowerCase();
  }
  return url?.startsWith('https://') ?? false;
}
