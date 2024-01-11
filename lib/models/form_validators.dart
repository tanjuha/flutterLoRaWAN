class FormValidators {
  static String? minLength(String value, int minLength) {
    if (value.trim().length < minLength) {
      return 'Must be at least $minLength characters long'; // TODO change message, should also be useful for numbers only
    }
    return null;
  }

  static String? maxLength(String value, int maxLength) {
    if (value.trim().length > maxLength) {
      return 'Must be at most $maxLength characters long'; // TODO change message, should also be useful for numbers only
    }
    return null;
  }

  static String? required(String value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? onlyNumbers(String value) {
    final RegExp regex = RegExp(r'^[0-9]+$');
    if (!regex.hasMatch(value)) {
      return 'Only numbers are allowed';
    }
    return null;
  }

  static String? positiveNumbers(String value) {
    if (int.tryParse(value)! <= 0) {
      return 'Must be a valid, positive number';
    }
    return null;
  }

  static String? noSymbols(String value) {
    final RegExp regex = RegExp(r'^[a-zA-Z0-9]+$');
    if (!regex.hasMatch(value)) {
      return 'Do not use symbols, only numbers or characters are allowed';
    }
    return null;
  }
}