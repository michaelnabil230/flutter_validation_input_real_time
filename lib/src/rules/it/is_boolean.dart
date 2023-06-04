import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsBool extends Rule {
  @override
  bool isValid(String value) => isBool(value);

  @override
  String toString() => 'validation.is_not_bool';
}

bool isBool(Object? input) {
  return [
    'true',
    'false',
    true,
    false,
  ].any((e) {
    if (e is String && input is String) {
      return e.compareTo(input.trim().toLowerCase()) == 0;
    } else {
      return e == input;
    }
  });
}
