import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDate extends Rule {
  @override
  bool isValid(String value) => isDate(value);

  @override
  String toString() => 'validation.is_not_date_format';
}

bool isDate(String? v) => DateTime.tryParse(v ?? '') != null;
