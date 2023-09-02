import 'package:flutter/material.dart' hide FormState;
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';
import 'package:flutter_validation_input_real_time/src/classes/form_group.dart';

class FormProvider extends ChangeNotifier {
  late FormGroup formGroup = const FormGroup();

  late List<ValidationTextEditingController> inputs;

  void setInputs(List<ValidationTextEditingController> inputs) =>
      this.inputs = inputs;

  void setFormGroup(FormGroup formGroup) => this.formGroup = formGroup;

  void check() {
    bool passes = _isPasses();

    Map<String, List<String>> errors = {
      for (final input in inputs) input.input.attribute: input.input.errors
    };

    FormState state = passes ? FormState.enable : FormState.disable;

    formGroup = formGroup.copyWith(state: state, errors: errors);
  }

  bool _isPasses() {
    if (formGroup.isEdit) {
      bool noInvalid = !inputs.any((input) => input.input.isInvalid);
      bool anyValid = inputs.any((input) => input.input.isValid);
      bool anyInitial = inputs.any((input) => input.input.isInitial);

      bool noEveryInitial = !inputs.every((input) => input.input.isInitial);

      return noInvalid && (anyValid && anyInitial || noEveryInitial);
    } else {
      return inputs.every((input) => input.input.isValid);
    }
  }

  void changeState(FormState state) {
    formGroup = formGroup.copyWith(state: state);

    notifyListeners();
  }
}
