import 'package:get/get.dart';
import 'package:on_track_app/core/constants/reg_exp_patterns.dart';
import 'package:on_track_app/core/enums/countries.dart';
import 'package:on_track_app/core/localization/strings.dart';

abstract class AppValidation {
  ////////////////////////////////////////////////////Public Methods
  static String? validateUserName(String? name) {
    if (name!.isEmpty) {
      return AppStrings.nameRequired;
    }
    if (name.length < 3) {
      return AppStrings.nameTooShort;
    }
    if (!name.isAlphabetOnly &&
            name.contains(RegExp(RegExpPatterns.specialCharactersPattern)) ||
        name.contains(RegExp(RegExpPatterns.digitPattern))) {
      return AppStrings.nameAlphabetOnly;
    }
    if (name.startsWith(RegExpPatterns.emptyPattern) ||
        name.endsWith(RegExpPatterns.emptyPattern) ||
        name.contains(RegExp(RegExpPatterns.twoSpacePattern))) {
      return AppStrings.nameFormatInvalid;
    }
    return null;
  }

  static String? validateProductName(String? name) {
    if (name!.isEmpty) {
      return AppStrings.nameRequired;
    }
    if (name.length < 3) {
      return AppStrings.nameTooShort;
    }
    if (name.startsWith(RegExpPatterns.emptyPattern) ||
        name.endsWith(RegExpPatterns.emptyPattern) ||
        name.contains(RegExp(RegExpPatterns.twoSpacePattern))) {
      return AppStrings.nameFormatInvalid;
    }
    return null;
  }

  static String? validateProductDescription(String? description) {
    if (description!.isEmpty) {
      return AppStrings.descriptionRequired;
    }
    if (!description.contains(RegExp(RegExpPatterns.atLeast3alphabeticPattern))) {
      return AppStrings.descriptionTooShort;
    }
    return null;
  }

  static String? validateProductPrice(String? price) {
    if (price!.isEmpty) {
      return AppStrings.priceRequired;
    }
    if (!price.contains(RegExp(RegExpPatterns.doubleNumberPattern))) {
      return AppStrings.priceShouldBeDigits;
    }
    return null;
  }

  static String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return AppStrings.emailRequired;
    }
    if (email.length < 5) {
      return AppStrings.emailTooShort;
    }
    if (!email.isEmail) {
      return AppStrings.emailFormatInvalid;
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password!.isEmpty) {
      return AppStrings.passwordRequired;
    }
    if (password.length < 6) {
      return AppStrings.passwordTooShort;
    }
    if (!password.contains(RegExp(RegExpPatterns.upperCasePattern))) {
      return AppStrings.password1Uppercase;
    }
    // Contains at least one lowercase letter
    if (!password.contains(RegExp(RegExpPatterns.lowerCasePattern))) {
      return AppStrings.password1Lowercase;
    }
    // Contains at least one digit
    if (!password.contains(RegExp(RegExpPatterns.digit2Pattern))) {
      return AppStrings.password1Digit;
    }
    // Contains at least one special character
    if (!password.contains(RegExp(RegExpPatterns.specialCharactersPattern))) {
      return AppStrings.password1SpecialCharacter;
    }
    return null;
  }

  static String? validateUserPhone(
      {String? phone, int? minLength = 7, Countries? country}) {
    if (phone!.isEmpty) {
      return AppStrings.phoneRequired;
    }
    if (phone.length < minLength!) {
      return AppStrings.phoneTooShort;
    }
    if (_validatePhoneFormatForCountry(country: country, phone: phone)) {
      return AppStrings.phoneFormatInvalid;
    }

    return null;
  }

  ////////////////////////////////////////////////////Private Methods
  static bool _validatePhoneFormatForCountry(
      {Countries? country, String? phone}) {
    switch (country) {
      case null:
        return _validateInternationalPhoneNumber(phone: phone);
      case Countries.egypt:
        return _validateEgyptPhoneNumber(phone: phone);
    }
  }

  ////////////////////////////////////////////////////////////////// Countries
  static bool _validateInternationalPhoneNumber({String? phone}) {
    ///International
    return true;
  }

  static bool _validateEgyptPhoneNumber({String? phone}) {
    ///Egypt
    return !phone!.startsWith(RegExp(RegExpPatterns.egyptPhonePrefixPattern));
  }
  //////////////////////////////////////////////////////////////////
}
