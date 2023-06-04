import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsIpAddress extends Rule {
  @override
  bool isValid(String value) => isIpAddress(value);

  @override
  String toString() => 'validation.is_ip_address';
}

bool isIpAddress(Object? input) {
  if (input == null || input is! String) {
    return false;
  } else {
    final ipParts = input.split('.');
    if (ipParts.length != 4) {
      return false;
    }
    bool isValid = true;
    for (final part in ipParts) {
      try {
        final int value = int.parse(part);
        if (value < 0 || value > 255) {
          isValid = false;
          break;
        }
      } catch (e) {
        isValid = false;
        break;
      }
    }
    return isValid;
  }
}
