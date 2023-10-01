import 'package:flutter_validation_input_real_time/src/classes/validation_names.dart';

class DefaultValidationMessages {
  static Map<String, String> messages = {
    ValidationNames.confirmedPassword:
        'The password confirmation does not match.',
    ValidationNames.passwordMin: 'Password must meet the minimum requirements.',
    ValidationNames.passwordLowercase:
        'Password must contain lowercase letters.',
    ValidationNames.passwordUppercase:
        'Password must contain uppercase letters.',
    ValidationNames.passwordSpecialCharacters:
        'Password must contain special characters.',
    ValidationNames.passwordNumbers: 'Password must contain numbers.',
    ValidationNames.mustBeAfterDate: 'Date must be after the specified date.',
    ValidationNames.mustBeBeforeDate: 'Date must be before the specified date.',
    ValidationNames.isNotDateFormat: 'Invalid date format.',
    ValidationNames.mustBeMax: 'Value must not exceed the maximum limit.',
    ValidationNames.mustBeInt: 'Value must be an integer.',
    ValidationNames.isDecimal: 'Value must be a decimal number.',
    ValidationNames.mustBeMin: 'Value must meet the minimum limit.',
    ValidationNames.isNumbersOnly: 'Only numbers are allowed.',
    ValidationNames.alphaNumeric: 'Value must be alphanumeric.',
    ValidationNames.requiredWhen:
        'This field is required under certain conditions.',
    ValidationNames.mustContainsAny: 'Value must contain specific elements.',
    ValidationNames.notRepeat: 'Value must not repeat previous entries.',
    ValidationNames.mustNotContainsAny:
        'Value must not contain certain elements.',
    ValidationNames.mustNotBeInList: 'Value must not be in the list.',
    ValidationNames.mustBeInList: 'Value must be in the list.',
    ValidationNames.isNotEmailAddress: 'Invalid email address format.',
    ValidationNames.isNotPort: 'Invalid port number.',
    ValidationNames.isIpAddress: 'Invalid IP address format.',
    ValidationNames.isNotValid: 'Value is not valid.',
    ValidationNames.isNotBool: 'Value must be a boolean.',
    ValidationNames.mustBeArabic: 'Value must be in Arabic language.',
    ValidationNames.mustBeEnglish: 'Value must be in English language.',
    ValidationNames.mustBeHexColor: 'Invalid hex color code.',
    ValidationNames.notValidInstagramUrl: 'Invalid Instagram URL.',
    ValidationNames.isNotSecureUrl: 'URL must be secure.',
    ValidationNames.notValidUrl: 'Invalid URL format.',
    ValidationNames.notValidFacebookUrl: 'Invalid Facebook URL.',
    ValidationNames.notValidYoutubeUrl: 'Invalid YouTube URL.',
    ValidationNames.isEgyptianPhone: 'Invalid Egyptian phone number.',
    ValidationNames.isSaudiPhone: 'Invalid Saudi Arabian phone number.',
    ValidationNames.username: 'Invalid username format.',
    ValidationNames.required: 'This field is required.',
    ValidationNames.isItContains:
        'Value does not contain the required element.',
    ValidationNames.mustEndWith: 'Value must end with a specific suffix.',
    ValidationNames.max: 'Value must not exceed the maximum limit.',
    ValidationNames.notContains: 'Value contains invalid characters.',
    ValidationNames.shouldMatch: 'Value should match another field.',
    ValidationNames.uppercase: 'Value must be in uppercase letters.',
    ValidationNames.mustBeRange: 'Value must be within a specific range.',
    ValidationNames.same: 'Value must be the same as another field.',
    ValidationNames.startsWith: 'Value must start with a specific prefix.',
    ValidationNames.min: 'Value must meet the minimum limit.',
    ValidationNames.lowercase: 'Value must be in lowercase letters.',
    ValidationNames.isEmpty: 'This field cannot be empty.',
  };
}
