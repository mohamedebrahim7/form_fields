import 'formz_validator.dart';

/// The translations for English (`en`).
class FormzValidatorEn extends FormzValidator {
  FormzValidatorEn([String locale = 'en']) : super(locale);

  @override
  String get emailEmptyError => 'Email cannot be empty';

  @override
  String get emailFormatError =>
      'Emails must follow the format \'example@example.com\'';

  @override
  String get passwordEmptyError => 'Password field cannot be empty';

  @override
  String get passwordLengthError =>
      'Password must be at least 8 characters long';

  @override
  String get passwordUppercaseError =>
      'Password must contain at least one uppercase letter';

  @override
  String get passwordLowercaseError =>
      'Password must contain at least one lowercase letter';

  @override
  String get passwordNumberError => 'Password must contain at least one number';

  @override
  String get passwordSpecialCharError =>
      'Password must contain at least one special character';

  @override
  String get passwordConfirmationEmptyError =>
      'Confirmation Password field cannot be empty';

  @override
  String get passwordConfirmationMismatchError => 'Password doesn\'t match';

  @override
  String get phoneEmptyError => 'Phone cannot be empty';

  @override
  String get phoneShortError => 'Invalid Mobile Number';

  @override
  String get phoneLongError => 'Invalid Mobile Number';

  @override
  String get termsUncheckedError => 'Please agree to the terms and conditions';

  @override
  String get usernameEmptyError => 'Name cannot be empty';

  @override
  String get usernameInvalidError =>
      'Names must be between 3 and 50 characters long, containing only letters, hyphens, and spaces';
}
