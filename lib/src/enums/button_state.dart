enum ButtonState {
  enable,
  disable,
  loading;

  bool get isEnable => this == ButtonState.enable;

  bool get isDisable => this == ButtonState.disable;

  bool get isLoading => this == ButtonState.loading;

  bool get canSubmit => isDisable || isLoading;
}
