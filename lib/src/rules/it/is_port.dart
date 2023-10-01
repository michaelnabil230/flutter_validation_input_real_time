import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsPort extends Rule {
  IsPort({
    super.customValidationMessage,
  });

  @override
  bool isValid(String value) {
    num? port = num.tryParse(value);
    if (port != null && port.toInt() != port) {
      return false;
    }

    return port != null && 0 <= port && port <= 65535;
  }

  @override
  String get name => ValidationNames.isNotPort;
}
