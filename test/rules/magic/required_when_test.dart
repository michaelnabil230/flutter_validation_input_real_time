import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('RequiredWhen', () {
    test(
        'isValid should return true when boolean is true and value is not empty',
        () {
      final rule = RequiredWhen(boolean: true, conditionName: 'conditionName');
      expect(rule.isValid('SomeValue'), isTrue);
    });

    test('isValid should return false when boolean is true and value is empty',
        () {
      final rule = RequiredWhen(boolean: true, conditionName: '');
      expect(rule.isValid(''), isFalse);
    });

    test('isValid should return true when boolean is false and value is empty',
        () {
      final rule = RequiredWhen(boolean: false, conditionName: 'conditionName');
      expect(rule.isValid(''), isTrue);
    });

    test(
        'isValid should return true when boolean is false and value is not empty',
        () {
      final rule = RequiredWhen(boolean: false, conditionName: 'conditionName');
      expect(rule.isValid('SomeValue'), isTrue);
    });

    test('error should return "required_when"', () {
      final rule = RequiredWhen(boolean: true, conditionName: 'conditionName');
      expect(rule.name, 'required_when');
    });
  });
}
