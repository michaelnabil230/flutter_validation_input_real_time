import 'package:equatable/equatable.dart';

class ButtonFormData extends Equatable {
  final bool isLoading;

  final bool disable;

  final bool isEditForm;

  final Map<String, List<String>> errors;

  const ButtonFormData({
    this.isLoading = false,
    this.disable = false,
    this.isEditForm = false,
    this.errors = const {},
  });

  ButtonFormData copyWith({
    bool? isLoading,
    bool? disable,
    bool? isEditForm,
    Map<String, List<String>>? errors,
  }) {
    return ButtonFormData(
      isLoading: isLoading ?? this.isLoading,
      disable: disable ?? this.disable,
      isEditForm: isEditForm ?? this.isEditForm,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object> get props => [isLoading, disable, isEditForm, errors];

  @override
  String toString() =>
      'ButtonFromData(isLoading: $isLoading, disable: $disable, isEditForm: $isEditForm, errors: $errors)';
}
