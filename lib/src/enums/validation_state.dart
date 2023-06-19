enum ValidationState { initial, valid, invalid }

extension ValidationStateX on ValidationState {
  bool get isInitial => this == ValidationState.initial;

  bool get isValid => this == ValidationState.valid;

  bool get isInvalid => this == ValidationState.invalid;
}
