import 'package:first_test_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Kiểm tra màn hình login", () {
    testWidgets("Kiểm tra màn hình đăng nhập có title không?",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      //Act
      Finder title = find.text("Đăng nhập");

      // Assert
      expect(title, findsNWidgets(2));
    });

    testWidgets("Kiểm tra màn hình login có field nhập email không",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      //Act
      Finder field = find.byKey(const ValueKey("email_id"));

      // Assert
      expect(field, findsOneWidget);
    });

    testWidgets("Kiểm tra màn hình login có field nhập password không",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      //Act
      Finder field = find.byKey(const ValueKey("password_id"));

      // Assert
      expect(field, findsOneWidget);
    });

    testWidgets("Kiểm tra màn hình login có nút một đăng nhập không",
        (widgetTester) async {
      // Arrange
      await widgetTester.pumpWidget(
        const MaterialApp(
          home: LoginScreen(),
        ),
      );

      //Act
      Finder buttonLogin = find.byType(ElevatedButton);

      // Assert
      expect(buttonLogin, findsOneWidget);
    });
  });

  testWidgets("Kiểm tra xem nếu nhất nút Login trong khi để trống Email",
      (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    //Act
    Finder buttonLogin = find.byType(ElevatedButton);
    await widgetTester.tap(buttonLogin);
    await widgetTester.pumpAndSettle();
    Finder errorText = find.text("Email không được để trống");

    // Assert
    expect(errorText, findsOneWidget);
  });

  testWidgets("Kiểm tra xem nếu nhất nút Login trường Email không hợp lệ",
      (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    //Act
    Finder emailField = find.byKey(const ValueKey('email_id'));
    await widgetTester.enterText(emailField, "abcdef");

    Finder buttonLogin = find.byType(ElevatedButton);
    await widgetTester.tap(buttonLogin);
    await widgetTester.pumpAndSettle();
    Finder errorText = find.text("Email không hợp lệ");

    // Assert
    expect(errorText, findsOneWidget);
  });

  testWidgets("Kiểm tra xem nếu nhất nút Login trường password trống",
      (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    //Act
    Finder buttonLogin = find.byType(ElevatedButton);
    await widgetTester.tap(buttonLogin);
    await widgetTester.pumpAndSettle();
    Finder errorTextEmpty = find.text("Mật khẩu không được để trống");

    // Assert
    expect(errorTextEmpty, findsOneWidget);
  });

  testWidgets("Kiểm tra xem nếu nhất nút Login trường password quá ngắn",
      (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    //Act
    Finder passwordField = find.byKey(const ValueKey('password_id'));
    await widgetTester.enterText(passwordField, "abcdef");

    Finder buttonLogin = find.byType(ElevatedButton);
    await widgetTester.tap(buttonLogin);
    await widgetTester.pumpAndSettle();
    Finder errorTextShort = find.text("Mật khẩu phải chứa ít nhất 8 ký tự");

    // Assert
    expect(errorTextShort, findsOneWidget);
  });

  testWidgets("Kiểm tra xem nếu nhất nút Login trường password quá dài",
      (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    //Act
    Finder passwordField = find.byKey(const ValueKey('password_id'));
    await widgetTester.enterText(passwordField, "abcdefghiklmnopqrstuvwxyz");

    Finder buttonLogin = find.byType(ElevatedButton);
    await widgetTester.tap(buttonLogin);
    await widgetTester.pumpAndSettle();
    Finder errorTextOverLength = find.text("Mật khẩu của bạn quá dài");

    // Assert
    expect(errorTextOverLength, findsOneWidget);
  });

  testWidgets(
      "Kiểm tra xem nếu nhất nút Login các field email đã được validated",
      (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    //Act
    Finder emailField = find.byKey(const ValueKey('email_id'));
    await widgetTester.enterText(emailField, "toilathor.job@gmail.com");

    Finder buttonLogin = find.byType(ElevatedButton);
    await widgetTester.tap(buttonLogin);
    await widgetTester.pumpAndSettle();

    Finder errorTextEmpty = find.text("Email không được để trống");
    Finder errorTextInvalid = find.text("Email không hợp lệ");

    // Assert
    expect(errorTextEmpty, findsNothing);
    expect(errorTextInvalid, findsNothing);
  });

  testWidgets(
      "Kiểm tra xem nếu nhất nút Login các field password đã được validated",
      (widgetTester) async {
    // Arrange
    await widgetTester.pumpWidget(
      const MaterialApp(
        home: LoginScreen(),
      ),
    );

    //Act
    Finder passwordField = find.byKey(const ValueKey('password_id'));
    await widgetTester.enterText(passwordField, "password");

    Finder buttonLogin = find.byType(ElevatedButton);
    await widgetTester.tap(buttonLogin);
    await widgetTester.pumpAndSettle();

    Finder errorTextEmpty = find.text("Mật khẩu không được để trống");
    Finder errorTextInvalid = find.text("Mật khẩu phải chứa ít nhất 8 ký tự");
    Finder errorTextOverLength = find.text("Mật khẩu của bạn quá dài");

    // Assert
    expect(errorTextEmpty, findsNothing);
    expect(errorTextInvalid, findsNothing);
    expect(errorTextOverLength, findsNothing);
  });
}
