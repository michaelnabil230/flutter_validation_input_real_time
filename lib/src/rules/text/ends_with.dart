import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class EndsWith extends Rule {
  final String end;

  EndsWith(
    this.end, {
    super.customError,
  });

  @override
  bool isValid(String value) => value.trim().endsWith(end);

  @override
  String error() => 'validation.must_end_with';
}
