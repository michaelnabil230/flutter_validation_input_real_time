import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsBool extends Rule {
  @override
  bool isValid(String value) {
    return [true, false, 'true', 'false', 0, 1, '0', '1'].any((e) {
      if (e is String) {
        return e.compareTo(value.trim().toLowerCase()) == 0;
      }

      return e == value;
    });
  }

  @override
  String toString() => 'validation.is_not_bool';
}
