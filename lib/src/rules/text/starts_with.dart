import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class StartsWith extends Rule {
  final Pattern pattern;

  StartsWith(this.pattern);

  @override
  bool isValid(String value) => value.trim().startsWith(pattern);

  @override
  String toString() => 'validation.starts_with';
}
