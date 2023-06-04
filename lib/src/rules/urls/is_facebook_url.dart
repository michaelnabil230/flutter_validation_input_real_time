import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsFacebookUrl extends Rule {
  @override
  bool isValid(String value) => isFacebookUrlValid(value);

  @override
  String toString() => 'validation.not_valid_facebook_url';
}

bool isFacebookUrlValid(String url) {
  return RegExp(
    r'^((https?):\/\/)((www\.)?(facebook|fb)\.(com))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
  ).hasMatch(url);
}
