class FieldValidators {
  static String? mobileValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    } else if (value.length < 10) {
      return "Enter valid phone number";
    }
    return null;
  }

  static String? passwordValidator(value) {
    if (value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 5) {
      return 'Password must be of greater than 5 character';
    }
    return null;
  }

  static String? globalValidator(value) {
    if (value.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  static String? chequeNoValidator(value) {
    if (value.isEmpty) {
      return 'Please enter cheque no';
    } else if (value.length < 6 || value.length > 6) {
      return 'cheque number must be 6-digit number';
    }
    return null;
  }

  // static String? phoneNumberValidator(value) {
  //   if (value.isEmpty) {
  //     return "";
  //   } else if (RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%A-Za-z-.,]')
  //       .hasMatch(value)) {
  //     return "Only Numbers are Allowed";
  //   } else {
  //     return null;
  //   }
  // }
}
