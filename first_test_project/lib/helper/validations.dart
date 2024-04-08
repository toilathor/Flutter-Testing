class Validations {
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Email không được để trống";
    }

    var pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    if (!RegExp(pattern).hasMatch(email)) {
      return "Email không hợp lệ";
    }

    return null;
  }

  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Mật khẩu không được để trống";
    }

    if (password.length < 8) {
      return "Mật khẩu phải chứa ít nhất 8 ký tự";
    }

    if (password.length > 16) {
      return "Mật khẩu của bạn quá dài";
    }

    return null;
  }
}
