import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/validation_state.dart';

class Input extends Equatable {
  final UniqueKey key;

  final String attribute;

  final String text;

  final List<Rule> Function() rules;

  final bool enabled;

  final List<String> ignoreValues;

  final List<String> errors;

  final ValidationState state;

  const Input({
    required this.key,
    required this.attribute,
    required this.text,
    required this.rules,
    this.enabled = true,
    this.ignoreValues = const [],
    this.errors = const [],
    this.state = ValidationState.initial,
  });

  Input runValidation(String text) {
    List<String> errors = [];

    for (final rule in rules.call()) {
      rule.initialization(attribute);

      if (rule is NotRepeat) {
        rule.setList(ignoreValues);
      }

      if (!rule.isValid(text)) {
        errors.add(rule.toString());
      }
    }

    return copyWith(text: text, errors: errors);
  }

  String? get error => errors.isEmpty ? null : errors.first;

  bool get isInitial => state.isInitial;

  bool get isValid => error == null && state.isValid;

  bool get isInvalid => state.isInvalid;

  Input addError(String error) => copyWith(errors: List.of(errors)..add(error));

  Input addIgnoreValues(List<String> ignore) =>
      copyWith(ignoreValues: List.of(ignoreValues)..addAll(ignore));

  Input clearError() => copyWith(text: '', errors: []);

  Input copyWith({
    String? attribute,
    String? text,
    List<Rule> Function()? rules,
    bool? enabled,
    List<String>? ignoreValues,
    List<String>? errors,
  }) {
    List<String> finalErrors = errors ?? this.errors;

    return Input(
      key: key,
      attribute: attribute ?? this.attribute,
      text: text ?? this.text,
      rules: rules ?? this.rules,
      enabled: enabled ?? this.enabled,
      ignoreValues: ignoreValues ?? this.ignoreValues,
      errors: finalErrors,
      state: finalErrors.isNotEmpty
          ? ValidationState.invalid
          : ValidationState.valid,
    );
  }

  @override
  List<Object> get props =>
      [key, attribute, text, enabled, rules, ignoreValues, errors];

  @override
  String toString() =>
      'Input(key: $key, attribute: $attribute, value: $text, errors: $errors)';
}
