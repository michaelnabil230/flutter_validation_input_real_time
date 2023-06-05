import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('IsLtr', () {
    test('should return true if value is not in a RTL language', () {
      final rule = IsLtr();

      expect(rule.isValid('English'), isTrue);
      expect(rule.isValid('123'), isTrue);
    });

    test('should return false if value is in a RTL language', () {
      final rule = IsLtr();

      expect(rule.isValid('عربي'), isFalse);
      expect(rule.isValid('مرحبا'), isFalse);
    });

    test('should return false if value is empty', () {
      final rule = IsLtr();

      expect(rule.isValid(''), isFalse);
    });
  });
}
