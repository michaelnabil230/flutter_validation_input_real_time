import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('IsRequiredWhen', () {
    test('should return true when boolean is true and value is not empty', () {
      final rule = IsRequiredWhen(boolean: true);
      expect(rule.isValid('example'), isTrue);
    });

    test('should return false when boolean is true and value is empty', () {
      final rule = IsRequiredWhen(boolean: true);
      expect(rule.isValid(''), isFalse);
    });

    test('should return false when boolean is false', () {
      final rule = IsRequiredWhen(boolean: false);
      expect(rule.isValid('example'), isFalse);
    });
  });
}
