class Validations {

  static bool validateMobileNumber(String value) {
    Pattern pattern = r'[0-9]{10}$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }

  }

  static bool validatePhone(String value) {
    if (value.length == 10) {
      return true;
    } else {
      return false;
    }
  }

   static bool validateOtp(String value) {
    if (value.length == 4) {
      return true;
    } else {
      return false;
    }
  }

  static bool validateString(String value) {
    if (value.isEmpty ) {
      return false;
    } else {
      return true;
    }
  }

  static bool validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern as String);
    if (!regex.hasMatch(value.trim())) {
      return false;
    } else {
      return true;
    }
  }
}