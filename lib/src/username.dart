import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../form_fields.dart';

class Username extends FormzInput<String, UsernameValidationError>
    with EquatableMixin {
  const Username.unvalidated([
    String value = '',
  ]) : super.pure(value);

  const Username.validated(
    String value,
  ) : super.dirty(value);

  static final _usernameRegex = RegExp(
    r'^[a-zA-Z]{3,}(?:-[a-zA-Z]+)*(?: [a-zA-Z]+(?:-[a-zA-Z]+)*){0,}$',
  );

  @override
  UsernameValidationError? validator(String value) {
    if (value.isEmpty) {
      return UsernameValidationError.empty;
    } else if (!_usernameRegex.hasMatch(value)) {
      return UsernameValidationError.invalid;
    } else {
      return null;
    }
  }
  @override
  List<Object?> get props => [
        value,
        pure,
      ];
}

enum UsernameValidationError {
  empty,
  invalid,
}

String? userNameErrMsg(
    UsernameValidationError? usernameValidationError, BuildContext context) {
  final l10n = FormzValidator.of(context);
  switch (usernameValidationError) {
    case UsernameValidationError.empty:
      return l10n.usernameEmptyError;
    case UsernameValidationError.invalid:
      return l10n.usernameInvalidError;
    default:
      return null;
  }
}
