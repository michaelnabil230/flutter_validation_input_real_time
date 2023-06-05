import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('Lowercase', () {
    final rule = Lowercase();

    test('returns true for lowercase string', () {
      final isValid = rule.isValid('hello');
      expect(isValid, true);
    });

    test('returns false for uppercase string', () {
      final isValid = rule.isValid('HELLO');
      expect(isValid, false);
    });

    test(
        'returns false for string with both lowercase and uppercase characters',
        () {
      final isValid = rule.isValid('Hello');
      expect(isValid, false);
    });

    test('returns false for string without any alphabetic characters', () {
      final isValid = rule.isValid('12345');
      expect(isValid, false);
    });
  });
}
