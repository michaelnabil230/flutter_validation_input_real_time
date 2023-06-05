import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('MaxLength', () {
    test('returns true for value with length less than or equal to the maximum',
        () {
      final rule = MaxLength(5);
      final isValid = rule.isValid('hello');
      expect(isValid, true);
    });

    test('returns false for value with length greater than the maximum', () {
      final rule = MaxLength(5);
      final isValid = rule.isValid('hello world');
      expect(isValid, false);
    });

    test('returns true for empty value regardless of the maximum length', () {
      final rule = MaxLength(5);
      final isValid = rule.isValid('');
      expect(isValid, true);
    });
  });
}
