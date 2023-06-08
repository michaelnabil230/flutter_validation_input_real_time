import 'package:equatable/equatable.dart';

class ButtonFromData extends Equatable {
  final bool isLoading;

  final bool passes;

  final bool isEditForm;

  const ButtonFromData({
    this.isLoading = false,
    this.passes = false,
    this.isEditForm = false,
  });

  ButtonFromData copyWith({
    bool? isLoading,
    bool? passes,
    bool? isEditForm,
  }) {
    return ButtonFromData(
      isLoading: isLoading ?? this.isLoading,
      passes: passes ?? this.passes,
      isEditForm: isEditForm ?? this.isEditForm,
    );
  }

  @override
  List<Object> get props => [isLoading, passes, isEditForm];
}
