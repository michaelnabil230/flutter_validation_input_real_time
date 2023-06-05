import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsSaudiPhone extends Rule {
  @override
  bool isValid(String value) =>
      RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$')
          .hasMatch(value);

  @override
  String toString() => 'validation.is_saudi_phone';
}
