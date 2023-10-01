import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsSecureUrl extends Rule {
  IsSecureUrl({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) {
    String url = value.toLowerCase();

    return url.startsWith('https://');
  }

  @override
  String get name => ValidationNames.isNotSecureUrl;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
