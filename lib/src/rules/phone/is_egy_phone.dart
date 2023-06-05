import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsEgyptianPhone extends Rule {
  IsEgyptianPhone({
    super.customError,
  });

  @override
  bool isValid(String value) => RegExp('^01[0125][0-9]{8}\$').hasMatch(value);

  @override
  String error() => 'validation.is_egyptian_phone';
}
