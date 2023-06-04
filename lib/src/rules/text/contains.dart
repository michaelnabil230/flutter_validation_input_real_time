import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Contains extends Rule {
  final String other;

  Contains(this.other);

  @override
  bool isValid(String value) => value.trim().contains(other);

  @override
  String toString() => 'validation.is_it_contains';
}
