import 'package:equatable/equatable.dart';

import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/bag.dart';
import 'package:flutter_validation_input_real_time/src/rules/lists/not_repeat_value.dart';
import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class Input extends Equatable {
  final String name;

  final String value;

  final List<Rule> rules;

  final List<String> oldValues;

  final Bag bag;

  const Input({
    required this.name,
    required this.value,
    required this.rules,
    this.oldValues = const [],
    this.bag = const Bag(),
  });

  Input runValidation(List<Input> inputs, String value) {
    Bag bag = Bag.passes();

    for (final rule in rules) {
      rule.setInputs(inputs);

      if (rule is NotRepeat) {
        rule.setList(oldValues);
      }

      if (!rule.isValid(value)) {
        bag = Bag.error(rule.toString());
        break;
      }
    }

    return copyWith(value: value, bag: bag);
  }

  String? get error => bag.error;

  bool get passes => bag.passes;

  bool get hasError => error != null;

  @override
  String toString() => 'Input(name: $name, value: $value, bag: $bag)';

  Input addError(String error) {
    Bag bag = Bag.error(error);

    return copyWith(bag: bag);
  }

  Input copyWith({
    String? name,
    String? value,
    List<Rule>? rules,
    List<String>? oldValues,
    Bag? bag,
  }) {
    return Input(
      name: name ?? this.name,
      value: value ?? this.value,
      rules: rules ?? this.rules,
      oldValues: oldValues ?? this.oldValues,
      bag: bag ?? this.bag,
    );
  }

  @override
  List<Object?> get props => [name, value, rules, oldValues, bag];
}
