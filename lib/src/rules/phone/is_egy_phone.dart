import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsEgyptianPhone extends Rule {
  IsEgyptianPhone({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) => RegExp('^01[0125][0-9]{8}\$').hasMatch(value);

  @override
  String get name => ValidationNames.isEgyptianPhone;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
