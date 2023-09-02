enum FormState {
  enable,
  disable,
  loading;

  bool get isEnable => this == FormState.enable;

  bool get isDisable => this == FormState.disable;

  bool get isLoading => this == FormState.loading;

  bool get canSubmit => isDisable || isLoading;
}
