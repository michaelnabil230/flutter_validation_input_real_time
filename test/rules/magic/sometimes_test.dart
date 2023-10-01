import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('Sometimes', () {
    test('should always return true', () {
      final rule = Sometimes();

      expect(rule.isValid('any value'), isTrue);
      expect(rule.isValid(''), isTrue);
      expect(rule.isValid('123'), isTrue);
    });

    test('should throw an exception when calling toString()', () {
      final rule = Sometimes();

      expect(() => rule.error, throwsException);
    });
  });
}
