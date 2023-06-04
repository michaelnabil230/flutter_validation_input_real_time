import 'package:flutter_validation_input_real_time/src/rules/rule.dart';

class IsYoutubeUrl extends Rule {
  @override
  bool isValid(String value) => isYoutubeUrLValid(value);

  @override
  String toString() => 'not_valid_youtube_url';
}

bool isYoutubeUrLValid(String url) => RegExp(
      r'^((https?):\/\/)((www\.)?(youtube)\.(com))\b([-a-zA-Z0-9()@:%_\+.~#?&//=]*)',
    ).hasMatch(url);
