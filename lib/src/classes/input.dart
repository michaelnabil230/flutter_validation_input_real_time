import 'package:equatable/equatable.dart';

import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/validation_state.dart';
import 'package:flutter_validation_input_real_time/src/rules/lists/not_repeat_value.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Input extends Equatable {
  final String attribute;

  final String value;

  final List<Rule> rules;

  final List<String> oldValues;

  final List<String> errors;

  final ValidationState state;

  const Input({
    required this.attribute,
    required this.value,
    required this.rules,
    this.oldValues = const [],
    this.errors = const [],
    this.state = ValidationState.initial,
  });

  Input runValidation(List<Input> inputs, String value) {
    ValidationState? state;
    List<String> errors = [];

    for (final rule in rules) {
      rule.initialization(inputs, attribute);

      if (rule is NotRepeat) {
        rule.setList(oldValues);
      }

      if (!rule.isValid(value)) {
        errors = List.of(this.errors)..add(rule.toString());
        state = ValidationState.invalid;
      }
    }

    return copyWith(
      value: value,
      errors: errors,
      state: state ?? ValidationState.valid,
    );
  }

  String? get error => errors.isEmpty ? null : errors.first;

  bool get isValid => state.isValid;

  bool get isInvalid => state.isInvalid;

  @override
  String toString() =>
      'Input(attribute: $attribute, value: $value, errors: $errors)';

  Input addError(String error) {
    return copyWith(errors: List.of(errors)..add(error));
  }

  Input copyWith({
    String? attribute,
    String? value,
    List<Rule>? rules,
    List<String>? oldValues,
    List<String>? errors,
    ValidationState? state,
  }) {
    return Input(
      attribute: attribute ?? this.attribute,
      value: value ?? this.value,
      rules: rules ?? this.rules,
      oldValues: oldValues ?? this.oldValues,
      errors: errors ?? this.errors,
      state: state ?? this.state,
    );
  }

  @override
  List<Object> get props => [attribute, value, rules, oldValues, errors];
}
