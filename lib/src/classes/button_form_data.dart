import 'package:equatable/equatable.dart';

class ButtonFromData extends Equatable {
  final bool isLoading;
  final bool isDisable;

  const ButtonFromData({
    this.isLoading = false,
    this.isDisable = false,
  });

  factory ButtonFromData.empty() => const ButtonFromData();

  factory ButtonFromData.enable() => const ButtonFromData(isDisable: false);

  factory ButtonFromData.disable() => const ButtonFromData(isDisable: true);

  factory ButtonFromData.loading() => const ButtonFromData(isLoading: true);

  @override
  List<Object> get props => [isLoading, isDisable];
}
