import 'package:flutter_test/flutter_test.dart' hide isEmpty;
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('IsEmpty', () {
    final rule = IsEmpty();

    test('returns true for empty string', () {
      final isValid = rule.isValid('');
      expect(isValid, true);
    });

    test('returns true for string with only whitespace characters', () {
      final isValid = rule.isValid('   ');
      expect(isValid, true);
    });

    test('returns false for non-empty string', () {
      final isValid = rule.isValid('hello');
      expect(isValid, false);
    });

    test('returns false for string with leading or trailing whitespace', () {
      final isValid = rule.isValid('  hello  ');
      expect(isValid, false);
    });
  });
}
