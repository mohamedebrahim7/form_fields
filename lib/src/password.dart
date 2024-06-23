import 'package:flutter/material.dart';

import '../form_fields.dart';

class Password extends FormzInput<String, PasswordValidationError> {
  //You use the unvalidated constructor when
  // you don’t want to validate your field’s value just yet
  const Password.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const Password.validated([
    String value = '',
  ]) : super.dirty(value);

  static final _uppercaseRegex = RegExp(r'[A-Z]');
  static final _lowercaseRegex = RegExp(r'[a-z]');
  static final _numberRegex = RegExp(r'[0-9]');
  static final _specialCharRegex = RegExp(r'[!@#$&*~_{}":<>?|,%^()+=]');

  @override
  PasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return PasswordValidationError.empty;
    } else if (!_uppercaseRegex.hasMatch(value)) {
      return PasswordValidationError.uppercaseMissing;
    } else if (!_lowercaseRegex.hasMatch(value)) {
      return PasswordValidationError.lowercaseMissing;
    } else if (!_numberRegex.hasMatch(value)) {
      return PasswordValidationError.numberMissing;
    } else if (!_specialCharRegex.hasMatch(value)) {
      return PasswordValidationError.specialCharMissing;
    } else if (value.length < 8) {
      return PasswordValidationError.lengthBelow8;
    } else {
      return null;
    }
  }
}

enum PasswordValidationError {
  empty,
  lengthBelow8,
  uppercaseMissing,
  lowercaseMissing,
  numberMissing,
  specialCharMissing,
}

String? passwordErrMsg(
    PasswordValidationError? passwordError, BuildContext context) {
  final l10n = FormzValidator.of(context);
  switch (passwordError) {
    case PasswordValidationError.empty:
      return l10n.passwordEmptyError;
    case PasswordValidationError.lengthBelow8:
      return l10n.passwordLengthError;
    case PasswordValidationError.uppercaseMissing:
      return l10n.passwordUppercaseError;
    case PasswordValidationError.lowercaseMissing:
      return l10n.passwordLowercaseError;
    case PasswordValidationError.numberMissing:
      return l10n.passwordNumberError;
    case PasswordValidationError.specialCharMissing:
      return l10n.passwordSpecialCharError;
    default:
      return null;
  }
}
