class FieldValidators {
  static String nameValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  static String emailValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!value.contains("@")) {
      return "Enter valid email";
    }
    return null;
  }

  static String passwordValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be of greater than 6 character';
    }
    return null;
  }

  static String phoneNumberValidator(value) {
    if (value.isEmpty) {
      return null;
    } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Za-z-.,]')
        .hasMatch(value)) {
      return "Only Numbers are Allowed";
    } else {
      return null;
    }
  }
}
