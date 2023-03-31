bool isRegisterCompliant() {
  if (hasUppercase == false ||
      hasDigits == false ||
      hasLowercase == false ||
      hasSpecialCharacters == false ||
      hasMinLength == false ||
      emailValid == false) {
    return false;
  }

  return true;
}
bool isPasswordvalidate() {
  if (hasUppercase == false ||
      hasDigits == false ||
      hasLowercase == false ||
      hasSpecialCharacters == false ||
      hasMinLength == false ) {
    return false;
  }

  return true;
}

bool emailValid(String email) {
  if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return true;
  }
  return false;
}

bool hasUppercase(String password) {
  if (password.contains(new RegExp(r'[A-Z]'))) {
    return true;
  }
  return false;
}

bool hasDigits(String password) {
  if (password.contains(new RegExp(r'[0-9]'))) {
    return true;
  }
  return false;
}

bool hasLowercase(String password) {
  if (password.contains(new RegExp(r'[a-z]'))) {
    return true;
  }
  return false;
}

bool hasSpecialCharacters(String password) {
  if (password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return true;
  }
  return false;
}

bool hasMinLength(String password, {int minLength = 3}) {
  if (password.length > minLength) {
    return true;
  }
  return false;
}
