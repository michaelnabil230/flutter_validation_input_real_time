import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

const _rtlLocales = <String>[
  'ar', // Arabic
  'fa', // Farsi
  'he', // Hebrew
  'ps', // Pashto
  'ur', // Urdu
];

class IsLtrLanguage extends Rule {
  @override
  bool isValid(String value) => isLtrLanguage(value);

  @override
  String toString() => 'validation.is_not_ltr_language_code';
}

bool isLtrLanguage(String languageCode) =>
    !_rtlLocales.contains(languageCode.toLowerCase());
