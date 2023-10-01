import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsSaudiPhone extends Rule {
  IsSaudiPhone({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) =>
      RegExp(r'^(009665|9665|\+9665|05|5)(5|0|3|6|4|9|1|8|7)([0-9]{7})$')
          .hasMatch(value);

  @override
  String get name => ValidationNames.isSaudiPhone;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
