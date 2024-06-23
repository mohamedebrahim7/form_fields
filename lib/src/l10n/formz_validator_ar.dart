import 'formz_validator.dart';

/// The translations for Arabic (`ar`).
class FormzValidatorAr extends FormzValidator {
  FormzValidatorAr([String locale = 'ar']) : super(locale);

  @override
  String get emailEmptyError => 'لا يمكن ترك البريد الإلكتروني فارغًا';

  @override
  String get emailFormatError =>
      'يجب أن يتبع البريد الإلكتروني النمط \'example@example.com\'';

  @override
  String get passwordEmptyError => 'لا يمكن ترك حقل كلمة المرور فارغًا';

  @override
  String get passwordLengthError =>
      'يجب أن تتكون كلمة المرور من 8 أحرف على الأقل';

  @override
  String get passwordUppercaseError =>
      'يجب أن تحتوي كلمة المرور على حرف كبير واحد على الأقل';

  @override
  String get passwordLowercaseError =>
      'يجب أن تحتوي كلمة المرور على حرف صغير واحد على الأقل';

  @override
  String get passwordNumberError =>
      'يجب أن تحتوي كلمة المرور على رقم واحد على الأقل';

  @override
  String get passwordSpecialCharError =>
      'يجب أن تحتوي كلمة المرور على حرف خاص واحد على الأقل';

  @override
  String get passwordConfirmationEmptyError =>
      'لا يمكن ترك حقل تأكيد كلمة المرور فارغًا';

  @override
  String get passwordConfirmationMismatchError => 'كلمة المرور غير متطابقة';

  @override
  String get phoneEmptyError => 'لا يمكن ترك حقل الهاتف فارغًا';

  @override
  String get phoneShortError => 'رقم الجوال غير صالح';

  @override
  String get phoneLongError => 'رقم الجوال غير صالح';

  @override
  String get termsUncheckedError => 'يرجى الموافقة على الشروط والأحكام';

  @override
  String get usernameEmptyError => 'لا يمكن ترك حقل الاسم فارغًا';

  @override
  String get usernameInvalidError =>
      'يجب أن يتراوح طول الأسماء بين 3 و 50 حرفًا، وتحتوي فقط على أحرف وواصلات ومسافات';
}
