import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

const _rtlLocales = <String>[
  'ar', // Arabic
  'fa', // Farsi
  'he', // Hebrew
  'ps', // Pashto
  'ur', // Urdu
];

class IsRTLLanguage extends Rule {
  @override
  bool isValid(String value) => isRtlLanguage(value);

  @override
  String toString() => 'validation.is_not_rtl_language_code';
}

bool isRtlLanguage(String languageCode) =>
    _rtlLocales.contains(languageCode.toLowerCase());
