import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class ContainsAny extends Rule {
  final List<String> list;

  final bool caseSensitive;

  ContainsAny(
    this.list, {
    this.caseSensitive = false,
    super.customError,
  });

  @override
  bool isValid(String value) =>
      containsAny(value, list, caseSensitive: caseSensitive);

  @override
  String error() => 'validation.must_contains_any';
}

bool containsAny(
  String v,
  List<String> list, {
  bool caseSensitive = false,
  bool trim = true,
}) {
  if (trim) {
    return list.any(
      (e) => caseSensitive
          ? v.trim().contains(e.trim())
          : v.trim().toLowerCase().contains(e.trim().toLowerCase()),
    );
  }
  return list.any(
    (e) => caseSensitive
        ? v.contains(e.trim())
        : v.toLowerCase().contains(e.toLowerCase()),
  );
}
