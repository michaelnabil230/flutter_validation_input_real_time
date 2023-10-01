import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

class NotRepeat extends Rule {
  late List<String> list;

  NotRepeat({
    super.customValidationMessage,
  });

  void setList(List<String> list) => this.list = list;

  @override
  bool isValid(String value) => IsNotIn(list).isValid(value);

  @override
  String get name => ValidationNames.notRepeat;

  @override
  String get error {
    return customValidationMessage == null
        ? defaultValidationMessages[name]!.call(attribute)
        : customValidationMessage!.call(attribute);
  }
}
