import 'package:flutter_validation_input_real_time/src/types/index.dart';

export 'package:flutter_validation_input_real_time/src/classes/validation_names.dart';
export 'package:flutter_validation_input_real_time/src/classes/default_validation_messages.dart';

abstract class Rule {
  ValidationMessage? customValidationMessage;

  Rule({
    this.customValidationMessage,
  });

  late String attribute;

  void initialization(String attribute) => this.attribute = attribute;

  bool isValid(String value);

  void setCustomValidationMessage(ValidationMessage callBack) =>
      customValidationMessage = callBack;

  String get name;

  String get error;
}
