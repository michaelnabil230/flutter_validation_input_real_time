import 'package:equatable/equatable.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

class FormGroup extends Equatable {
  final FormState state;

  final bool isEdit;

  final Map<String, List<String>> errors;

  const FormGroup({
    this.state = FormState.enable,
    this.isEdit = false,
    this.errors = const {},
  });

  FormGroup copyWith({
    FormState? state,
    bool? isEdit,
    Map<String, List<String>>? errors,
  }) {
    return FormGroup(
      state: state ?? this.state,
      isEdit: isEdit ?? this.isEdit,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object> get props => [state, isEdit, errors];

  @override
  String toString() =>
      'FormGroup(state: $state, isEdit: $isEdit, errors: $errors)';
}
