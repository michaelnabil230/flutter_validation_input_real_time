import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Match extends Rule {
  final String other;
  final bool caseSensitive;

  Match(
    this.other, {
    this.caseSensitive = true,
  });

  @override
  bool isValid(String value) => caseSensitive
      ? match(value, other)
      : match(value.toLowerCase(), other.toLowerCase());

  @override
  String toString() => 'validation.should_match';
}

bool match(
  Object? input,
  Object? other,
) =>
    input != null &&
        other != null &&
        input.runtimeType == other.runtimeType &&
        identical(input, other) ||
    input == other;
