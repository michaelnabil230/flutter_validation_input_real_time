import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('IsEmail', () {
    test('should return true for valid email addresses', () {
      final rule = IsEmail();

      expect(rule.isValid('test@example.com'), isTrue);
      expect(rule.isValid('user.name@example.com'), isTrue);
      expect(rule.isValid('first.last@example.com'), isTrue);
      expect(rule.isValid('email@example.co'), isTrue);
      expect(rule.isValid('email@example.co.uk'), isTrue);
      expect(rule.isValid('email@example-domain.com'), isTrue);
    });

    test('should return false for invalid email addresses', () {
      final rule = IsEmail();

      expect(rule.isValid(''), isFalse);
      expect(rule.isValid('notanemail'), isFalse);
      expect(rule.isValid('user@.com'), isFalse);
      expect(rule.isValid('user@domain.'), isFalse);
      expect(rule.isValid('user@domain'), isFalse);
      expect(rule.isValid('user@@example.com'), isFalse);
      expect(rule.isValid('@example.com'), isFalse);
    });
  });
}
