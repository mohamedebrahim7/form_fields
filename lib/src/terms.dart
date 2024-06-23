import 'package:flutter/material.dart';

import '../form_fields.dart';

class Terms extends FormzInput<bool, TermsValidationError> {
  const Terms.pure() : super.pure(false);

  const Terms.dirty(bool value) : super.dirty(value);

  @override
  TermsValidationError? validator(bool value) {
    if (value) {
      return null;
    } else {
      return TermsValidationError.unchecked;
    }
  }
}

enum TermsValidationError {
  unchecked,
}

String? termsErrMsg(
    TermsValidationError? termsValidationError, BuildContext context) {
  final l10n = FormzValidator.of(context);
  switch (termsValidationError) {
    case TermsValidationError.unchecked:
      return l10n.termsUncheckedError;
    default:
      return null;
  }
}
