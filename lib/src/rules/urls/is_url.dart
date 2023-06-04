import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsUrl extends Rule {
  @override
  bool isValid(String value) => isUrlValid(value);

  @override
  String toString() => 'not_valid_url';
}

bool isUrlValid(String url) {
  return RegExp(
    r'^((https?):\/\/)((www\.)?([a-zA-Z0-9!_$]+)\.([a-zA-Z]{2,5}))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)$',
  ).hasMatch(url);
}
