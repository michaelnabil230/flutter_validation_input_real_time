import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsSecureUrl extends Rule {
  @override
  bool isValid(String value) {
    String url = value.toLowerCase();

    return url.startsWith('https://');
  }

  @override
  String toString() => 'validation.is_not_secure_url';
}
