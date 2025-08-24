abstract final class FormValidator {
  static String? requiredField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }

    return null;
  }

  static String? passwordField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }
    if (value.length > 6) {
      return 'This must be 6 character.';
    }

    return null;
  }

  static String? emailField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required.';
    }

    final regExp = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

    if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email.';
    }

    return null;
  }
}
