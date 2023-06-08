abstract class Rule {
  final String? customError;

  Rule({
    this.customError,
  });

  late String attribute;

  void initialization(String attribute) => this.attribute = attribute;

  bool isValid(String value);

  String error();

  @override
  String toString() => customError ?? error();
}
