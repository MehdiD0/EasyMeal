class FormValidators {
  static String? validateEmailFct(String? value) {
    const pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'* /=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    final regex = RegExp(pattern);
    if (value!.isEmpty) {
      return "Email Can't be empty ";
    } else if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  static String? validatePassFct(String? value) {
    const pattern = r'^(?=.*[A-Z])(?=.*[0-9])(?=.*[@#\&*~]).{8,}$';
    final regex = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return "Password can't be empty.";
    } else if (!regex.hasMatch(value)) {
      return 'The password must be at least 8 characters long,\ninclude one uppercase letter, one digit,\nand one special character among (@#\\&*~).';
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return "Full name can't be empty";
    }

    final RegExp nameRegExp = RegExp(r'^[a-zA-ZÀ-ÿ\s\-]+$');
    if (value.length < 3) {
      return "Name must be at least 3 characters long";
    }

    if (!nameRegExp.hasMatch(value)) {
      return "Name can only contain letters, spaces and hyphens";
    }

    return null;
}
}
