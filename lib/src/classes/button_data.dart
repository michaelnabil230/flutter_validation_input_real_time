import 'package:equatable/equatable.dart';
import 'package:flutter_validation_input_real_time/flutter_validation_input_real_time.dart';

class ButtonData extends Equatable {
  final ButtonState state;

  final bool isEditForm;

  final Map<String, List<String>> errors;

  const ButtonData({
    this.state = ButtonState.enable,
    this.isEditForm = false,
    this.errors = const {},
  });

  ButtonData copyWith({
    ButtonState? state,
    bool? isEditForm,
    Map<String, List<String>>? errors,
  }) {
    return ButtonData(
      state: state ?? this.state,
      isEditForm: isEditForm ?? this.isEditForm,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object> get props => [state, isEditForm, errors];

  @override
  String toString() =>
      'ButtonFromData(state: $state, isEditForm: $isEditForm, errors: $errors)';
}
