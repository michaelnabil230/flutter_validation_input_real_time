// Map<String, Map<String, String>> bag = {
//   'name': {
//     'required': 'massage',
//   }
// };

class Bag {
  final List<String> errors;

  const Bag({
    this.errors = const [],
  });

  factory Bag.empty() => const Bag();

  bool get isValid => errors.isEmpty;

  bool get isInvalid => !isValid;

  @override
  String toString() =>
      'Bug(errors: $errors, isValid: $isValid, isInvalid: $isInvalid)';
}
