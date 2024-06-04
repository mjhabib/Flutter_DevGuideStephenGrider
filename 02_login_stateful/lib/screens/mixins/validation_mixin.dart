mixin ValidationMixin {
  String? validateEmail(value) {
    if (value != null) {
      if (!value.contains('@')) {
        return 'Please enter a valid email';
      }
    }
    return null;
  }

  String? validatePassword(value) {
    if (value != null) {
      if (value.length < 6) {
        return 'Password must be at least 6 characters';
      }
    }
    return null;
  }
}
