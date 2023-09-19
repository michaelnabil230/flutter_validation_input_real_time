import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('IsRequiredWhen', () {
    test(
        'isValid should return true when boolean is true and value is not empty',
        () {
      final rule = IsRequiredWhen(boolean: true);
      expect(rule.isValid('SomeValue'), isTrue);
    });

    test('isValid should return false when boolean is true and value is empty',
        () {
      final rule = IsRequiredWhen(boolean: true);
      expect(rule.isValid(''), isFalse);
    });

    test('isValid should return true when boolean is false and value is empty',
        () {
      final rule = IsRequiredWhen(boolean: false);
      expect(rule.isValid(''), isTrue);
    });

    test(
        'isValid should return true when boolean is false and value is not empty',
        () {
      final rule = IsRequiredWhen(boolean: false);
      expect(rule.isValid('SomeValue'), isTrue);
    });

    test('error should return "validation.required_when"', () {
      final rule = IsRequiredWhen(boolean: true);
      expect(rule.error(), 'validation.required_when');
    });
  });
}
