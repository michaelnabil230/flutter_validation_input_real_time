import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsDecimal extends Rule {
  IsDecimal({
    super.customError,
  });

  @override
  bool isValid(String value) => double.tryParse(value) != null;

  @override
  String error() => 'validation.is_decimal';
}
