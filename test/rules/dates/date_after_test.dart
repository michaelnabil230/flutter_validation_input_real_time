import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation_input_real_time/src/rules/index.dart';

void main() {
  group('IsDateAfter', () {
    test('should return true if value is a date after the specified date', () {
      final rule = IsDateAfter(DateTime(2022, 1, 1));

      expect(rule.isValid('2022-01-02'), isTrue);
      expect(rule.isValid('2023-05-10'), isTrue);
      expect(rule.isValid('2022-12-31'), isTrue);
    });

    test(
        'should return false if value is a date on or before the specified date',
        () {
      final rule = IsDateAfter(DateTime(2022, 1, 1));

      expect(rule.isValid('2022-01-01'), isFalse);
      expect(rule.isValid('2021-12-31'), isFalse);
      expect(rule.isValid('2021-05-10'), isFalse);
    });

    test('should return false if value is not a valid date', () {
      final rule = IsDateAfter(DateTime(2022, 1, 1));

      expect(rule.isValid('not_a_date'), isFalse);
      expect(rule.isValid('2022-13-01'), isFalse);
      expect(rule.isValid('2022-01-32'), isFalse);
    });
  });
}
