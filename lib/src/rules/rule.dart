import 'package:flutter_validation_input_real_time/src/classes/default_validation_messages.dart';

export 'package:flutter_validation_input_real_time/src/classes/validation_names.dart';

typedef ValidationMessage = String Function(String value);

abstract class Rule {
  final ValidationMessage? customValidationMessage;

  Rule({
    this.customValidationMessage,
  });

  late String attribute;

  late String _value;

  void initialization(String value, String attribute) {
    _value = value;
    this.attribute = attribute;
  }

  bool isValid(String value);

  String get name;

  @override
  String toString() {
    return customValidationMessage == null
        ? DefaultValidationMessages.messages[name] ??
            'ERROR: Not found this validation message'
        : customValidationMessage!.call(_value);
  }
}
