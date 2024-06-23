import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'formz_validator_ar.dart';
import 'formz_validator_en.dart';

/// Callers can lookup localized strings with an instance of FormzValidator
/// returned by `FormzValidator.of(context)`.
///
/// Applications need to include `FormzValidator.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/formz_validator.dart';
///
/// return MaterialApp(
///   localizationsDelegates: FormzValidator.localizationsDelegates,
///   supportedLocales: FormzValidator.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the FormzValidator.supportedLocales
/// property.
abstract class FormzValidator {
  FormzValidator(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static FormzValidator of(BuildContext context) {
    return Localizations.of<FormzValidator>(context, FormzValidator)!;
  }

  static const LocalizationsDelegate<FormzValidator> delegate =
      _FormzValidatorDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @emailEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Email cannot be empty'**
  String get emailEmptyError;

  /// No description provided for @emailFormatError.
  ///
  /// In en, this message translates to:
  /// **'Emails must follow the format \'example@example.com\''**
  String get emailFormatError;

  /// No description provided for @passwordEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Password field cannot be empty'**
  String get passwordEmptyError;

  /// No description provided for @passwordLengthError.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long'**
  String get passwordLengthError;

  /// No description provided for @passwordUppercaseError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter'**
  String get passwordUppercaseError;

  /// No description provided for @passwordLowercaseError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one lowercase letter'**
  String get passwordLowercaseError;

  /// No description provided for @passwordNumberError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number'**
  String get passwordNumberError;

  /// No description provided for @passwordSpecialCharError.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character'**
  String get passwordSpecialCharError;

  /// No description provided for @passwordConfirmationEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Confirmation Password field cannot be empty'**
  String get passwordConfirmationEmptyError;

  /// No description provided for @passwordConfirmationMismatchError.
  ///
  /// In en, this message translates to:
  /// **'Password doesn\'t match'**
  String get passwordConfirmationMismatchError;

  /// No description provided for @phoneEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Phone cannot be empty'**
  String get phoneEmptyError;

  /// No description provided for @phoneShortError.
  ///
  /// In en, this message translates to:
  /// **'Invalid Mobile Number'**
  String get phoneShortError;

  /// No description provided for @phoneLongError.
  ///
  /// In en, this message translates to:
  /// **'Invalid Mobile Number'**
  String get phoneLongError;

  /// No description provided for @termsUncheckedError.
  ///
  /// In en, this message translates to:
  /// **'Please agree to the terms and conditions'**
  String get termsUncheckedError;

  /// No description provided for @usernameEmptyError.
  ///
  /// In en, this message translates to:
  /// **'Name cannot be empty'**
  String get usernameEmptyError;

  /// No description provided for @usernameInvalidError.
  ///
  /// In en, this message translates to:
  /// **'Names must be between 3 and 50 characters long, containing only letters, hyphens, and spaces'**
  String get usernameInvalidError;
}

class _FormzValidatorDelegate extends LocalizationsDelegate<FormzValidator> {
  const _FormzValidatorDelegate();

  @override
  Future<FormzValidator> load(Locale locale) {
    return SynchronousFuture<FormzValidator>(lookupFormzValidator(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_FormzValidatorDelegate old) => false;
}

FormzValidator lookupFormzValidator(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return FormzValidatorAr();
    case 'en':
      return FormzValidatorEn();
  }

  throw FlutterError(
      'FormzValidator.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
