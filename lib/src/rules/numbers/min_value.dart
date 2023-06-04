import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class MinValue extends Rule {
  final int min;

  MinValue(this.min);

  @override
  bool isValid(String value) => getLength(value) >= min;

  @override
  String toString() => 'validation.must_be_min';
}

int getLength(Object? value) {
  String? val;

  if (value is String) {
    val = value;
  } else if (value is num) {
    val = value.toString();
  } else if (value is int) {
    val = value.toString();
  } else if (value is double) {
    val = value.toString();
  }

  return val!.length;
}
