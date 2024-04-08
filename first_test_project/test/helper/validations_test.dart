import 'package:first_test_project/helper/validations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Kiểm tra hàm validation email", () {
    test("Trường hợp email empty", () {
      // Arrange
      String email = "";

      //Act
      var result = Validations.validateEmail(email);

      //Assert
      expect(result, "Email không được để trống");
    });

    test("Trường hợp email không hợp lệ", () {
      // Arrange
      String email = "abcdefghijklmnopqrstuvwxyz";

      //Act
      var result = Validations.validateEmail(email);

      //Assert
      expect(result, "Email không hợp lệ");
    });

    test("Trường hợp email hợp lệ", () {
      // Arrange
      String email = "abc@gmail.com";

      //Act
      var result = Validations.validateEmail(email);

      //Assert
      expect(result, null);
    });
  });

  group("Kiểm tra hàm validation password", () {
    test("Trường hợp password empty", () {
      // Arrange
      String email = "";

      //Act
      var result = Validations.validatePassword(email);

      //Assert
      expect(result, "Mật khẩu không được để trống");
    });

    test("Trường hợp mật khẩu quá ngắn ít hơn 8 ký tự", () {
      // Arrange
      String email = "abcadas";

      //Act
      var result = Validations.validatePassword(email);

      //Assert
      expect(result, "Mật khẩu phải chứa ít nhất 8 ký tự");
    });

    test("Trường hợp mật khẩu quá dài hơn 16 ký tự", () {
      // Arrange
      String email = "abcadasadshderqhqgreqhrqagq";

      //Act
      var result = Validations.validatePassword(email);

      //Assert
      expect(result, "Mật khẩu của bạn quá dài");
    });

    test("Trường hợp password hợp lệ", () {
      // Arrange
      String email = "abcdefA@";

      //Act
      var result = Validations.validatePassword(email);

      //Assert
      expect(result, null);
    });
  });
}
