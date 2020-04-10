class ValidationMixin {
  String validateEmail(String value) {
    // Return null if valid or string with message if invalid
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must at least 6 characters';
    }
    return null;
  }
}