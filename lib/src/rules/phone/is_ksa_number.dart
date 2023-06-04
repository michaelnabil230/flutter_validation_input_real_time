import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class ISKsaPhone extends Rule {
  @override
  bool isValid(String value) => isKsaPhone(value);

  @override
  String toString() => 'validation.is_ksa_num';
}

bool isKsaPhone(String input) {
  return RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$')
      .hasMatch(input);
}
