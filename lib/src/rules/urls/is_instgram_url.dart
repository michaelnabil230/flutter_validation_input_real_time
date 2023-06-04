import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsInstagramUrl extends Rule {
  @override
  bool isValid(String value) => isInstagramUrlValid(value);

  @override
  String toString() => 'not_valid_instagram_url';
}

bool isInstagramUrlValid(String url) => RegExp(
      r'^((https?):\/\/)((www\.)?(instagram)\.(com))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    ).hasMatch(url);
