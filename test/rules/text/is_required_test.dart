import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('IsRequired', () {
    final rule = IsRequired();

    test('returns true for non-empty string', () {
      final isValid = rule.isValid('hello');
      expect(isValid, true);
    });

    test('returns false for empty string', () {
      final isValid = rule.isValid('');
      expect(isValid, false);
    });

    test('returns false for string with only whitespace characters', () {
      final isValid = rule.isValid('   ');
      expect(isValid, false);
    });

    test('returns false for string with leading or trailing whitespace', () {
      final isValid = rule.isValid('  hello  ');
      expect(isValid, false);
    });
  });
}
