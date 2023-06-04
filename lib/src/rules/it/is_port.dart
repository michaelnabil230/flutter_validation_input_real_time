import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsPort extends Rule {
  @override
  bool isValid(String value) => isPort(value);

  @override
  String toString() => 'validation.is_not_port';
}

bool isPort(Object? input) {
  num? port;
  if (input is String) {
    port = num.tryParse(input);
  } else if (input is num) {
    port = input;
  }
  if (port != null && port.toInt() != port) {
    return false;
  }

  return port != null && 0 <= port && port <= 65535;
}
