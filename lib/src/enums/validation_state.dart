enum ValidationState {
  initial,
  valid,
  invalid;

  bool get isInitial => this == ValidationState.initial;

  bool get isValid => this == ValidationState.valid;

  bool get isInvalid => this == ValidationState.invalid;
}
