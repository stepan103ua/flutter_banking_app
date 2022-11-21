class AppValidation {
  static String? passwordValidation(String? value) {
    if (value == null) {
      return 'Field can not be empty';
    }
    if (!AppValidationRegex.passwordRegex.hasMatch(value)) {
      return 'Invalid password';
    }

    return null;
  }

  static String? phoneNumberValidation(String? value) {
    print('Phone validation');
    if (value == null) {
      return 'Field can not be empty';
    }
    if (!AppValidationRegex.phoneNumberRegex.hasMatch(value)) {
      return 'Invalid phone number';
    }

    return null;
  }

  static String? credentialsValidation(String? value) {
    if (value == null) {
      return 'Field can not be empty';
    }
    if (!AppValidationRegex.credentialsRegex.hasMatch(value)) {
      return 'Invalid credentials';
    }

    return null;
  }

  static String? passportValidation(String? value) {
    if (value == null) {
      return 'Field can not be empty';
    }
    if (!AppValidationRegex.oldPassportFormat.hasMatch(value) &&
        !AppValidationRegex.sixteenPassportFormat.hasMatch(value) &&
        !AppValidationRegex.twentyPassportFormat.hasMatch(value)) {
      return 'Invalid passport data';
    }

    return null;
  }
}

class AppValidationRegex {
  static const _passwordRegex =
      r"^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z]{6,}$";
  static const _phoneNumberRegex =
      r"^\+?([0-9]{2})\)?[-. ]?([0-9]{5})[-. ]?([0-9]{5})$";
  static const _credentialsRegex =
      r"/^[\w'\-,.][^0-9_!¡?÷?¿/\\+=@#$%ˆ&*(){}|~<>;:[\]]{2,}$/";
  static const _oldPassportFormat = r"^[А-ЯA-Z]{2}\d{6}$";
  static const _sixteenPassportFormat = r"^\d{13}$";
  static const _twentyPassportFormat = r"^\d{9}$";

  static RegExp get passwordRegex => RegExp(_passwordRegex);
  static RegExp get phoneNumberRegex => RegExp(_phoneNumberRegex);
  static RegExp get credentialsRegex => RegExp(_credentialsRegex);
  static RegExp get oldPassportFormat => RegExp(_oldPassportFormat);
  static RegExp get sixteenPassportFormat => RegExp(_sixteenPassportFormat);
  static RegExp get twentyPassportFormat => RegExp(_twentyPassportFormat);
}
