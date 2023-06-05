import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Match extends Rule {
  final String other;
  final bool caseSensitive;

  Match(
    this.other, {
    this.caseSensitive = true,
    super.customError,
  });

  @override
  bool isValid(String value) => caseSensitive
      ? _match(value, other)
      : _match(value.toLowerCase(), other.toLowerCase());

  @override
  String error() => 'validation.should_match';
}

bool _match(
  String input,
  String other,
) =>
    input.runtimeType == other.runtimeType && identical(input, other) ||
    input == other;
