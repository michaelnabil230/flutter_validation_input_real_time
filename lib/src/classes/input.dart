import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

class Input extends Equatable {
  final String attribute;

  final String initText;

  final String text;

  final ValueGetter<List<Rule>> rules;

  final bool enabled;

  final List<String> ignoreValues;

  final List<String> errors;

  final ValidationState state;

  final Status status;

  Input({
    required this.attribute,
    required this.text,
    required this.rules,
    this.enabled = true,
    this.ignoreValues = const [],
    this.errors = const [],
    String? initText,
    ValidationState? state,
    this.status = Status.initial,
  })  : initText = initText ?? text,
        state = state ??
            (text.isNotEmpty ? ValidationState.valid : ValidationState.initial);

  Input runValidation(
    String text,
    Map<String, ValidationMessage> validationMessages,
  ) {
    List<String> errors = [];

    if (text == initText && status == Status.edit) {
      return copyWith(text: text, state: ValidationState.initial);
    }

    for (final rule in rules.call()) {
      rule.initialization(attribute);

      if (rule is NotRepeat) {
        rule.setList(ignoreValues);
      }

      if (!rule.isValid(text)) {
        if (rule.customValidationMessage == null) {
          final validationMessage = validationMessages[rule.name];

          if (validationMessage != null) {
            rule.setCustomValidationMessage(validationMessage);
          }
        }

        errors.add(rule.error);
      }
    }

    return copyWith(text: text, errors: errors);
  }

  String? get error => errors.isNotEmpty ? errors.first : null;

  bool get isInitial => state.isInitial;

  bool get isValid => error == null && state.isValid;

  bool get isInvalid => state.isInvalid;

  Input addError(String error) => copyWith(errors: List.of(errors)..add(error));

  Input addIgnoreValues(List<String> ignore) =>
      copyWith(ignoreValues: List.of(ignoreValues)..addAll(ignore));

  Input clearError() => runValidation('', {});

  Input copyWith({
    String? attribute,
    String? text,
    ValueGetter<List<Rule>>? rules,
    bool? enabled,
    List<String>? ignoreValues,
    List<String>? errors,
    ValidationState? state,
  }) {
    List<String> finalErrors = errors ?? this.errors;
    ValidationState finalState = state ??
        (finalErrors.isEmpty ? ValidationState.valid : ValidationState.invalid);

    return Input(
      attribute: attribute ?? this.attribute,
      text: text ?? this.text,
      initText: initText,
      rules: rules ?? this.rules,
      enabled: enabled ?? this.enabled,
      ignoreValues: ignoreValues ?? this.ignoreValues,
      status: status,
      errors: finalErrors,
      state: finalState,
    );
  }

  @override
  List<Object> get props => [
        attribute,
        text,
        initText,
        enabled,
        rules,
        status,
        ignoreValues,
        errors,
      ];

  @override
  String toString() {
    return 'Input(attribute: $attribute, text: $text, state: $state, errors: $errors)';
  }
}
