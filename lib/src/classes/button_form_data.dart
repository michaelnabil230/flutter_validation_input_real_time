import 'package:equatable/equatable.dart';

class ButtonFormData extends Equatable {
  final bool isLoading;

  final bool passes;

  final bool isEditForm;

  final Map<String, List<String>> errors;

  const ButtonFormData({
    this.isLoading = false,
    this.passes = false,
    this.isEditForm = false,
    this.errors = const {},
  });

  ButtonFormData copyWith({
    bool? isLoading,
    bool? passes,
    bool? isEditForm,
    Map<String, List<String>>? errors,
  }) {
    return ButtonFormData(
      isLoading: isLoading ?? this.isLoading,
      passes: passes ?? this.passes,
      isEditForm: isEditForm ?? this.isEditForm,
      errors: errors ?? this.errors,
    );
  }

  @override
  List<Object> get props => [isLoading, passes, isEditForm, errors];

  @override
  String toString() =>
      'ButtonFromData(isLoading: $isLoading, passes: $passes, isEditForm: $isEditForm, errors: $errors)';
}
