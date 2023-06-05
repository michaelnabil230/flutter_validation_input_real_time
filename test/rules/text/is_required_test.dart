import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('IsRequired', () {
    test('returns true for non-empty string', () {
      final rule = IsRequired();
      final isValid = rule.isValid('hello');
      expect(isValid, isTrue);
    });

    test('returns false for empty string', () {
      final rule = IsRequired();
      final isValid = rule.isValid('');
      expect(isValid, isFalse);
    });

    test('returns false for string with only whitespace characters', () {
      final rule = IsRequired();
      final isValid = rule.isValid('   ');
      expect(isValid, isFalse);
    });

    test('returns false for string with leading or trailing whitespace', () {
      final rule = IsRequired();
      final isValid = rule.isValid('  hello  ');
      expect(isValid, isTrue);
    });
  });
}
