import 'package:first_test_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  group("Login Flow Test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
      "Kiểm tra nếu không nhập gì mà nhấn login thì chuyển báo lỗi ở 2 fiels là không được để trống",
      (WidgetTester widgetTester) async {
        // Arrange
        await widgetTester.pumpWidget(
          const MaterialApp(
            home: LoginScreen(),
          ),
        );

        //Act
        Finder buttonLogin = find.byType(ElevatedButton);
        await widgetTester.tap(buttonLogin);
        await widgetTester.pumpAndSettle(const Duration(seconds: 2));

        Finder emailErrorText = find.text('Email không được để trống');
        Finder passwordErrorText = find.text('Mật khẩu không được để trống');

        // Assert
        expect(emailErrorText, findsOne);
        expect(passwordErrorText, findsOne);
      },
    );

    testWidgets(
      "Kiểm tra nếu mà login thành cồng thì chuyển đến màn Home",
      (WidgetTester widgetTester) async {
        // Arrange
        await widgetTester.pumpWidget(
          const MaterialApp(
            home: LoginScreen(),
          ),
        );

        //Act
        Finder emailField = find.byKey(const ValueKey('email_id'));
        await widgetTester.enterText(emailField, "toilathor.job@gmail.com");

        Finder passwordField = find.byKey(const ValueKey('password_id'));
        await widgetTester.enterText(passwordField, "password");

        Finder buttonLogin = find.byType(ElevatedButton);
        await widgetTester.tap(buttonLogin);
        await widgetTester.pumpAndSettle(const Duration(seconds: 2));

        Finder welcomeText = find.text('Welcome Integration Testing');

        // Assert
        expect(welcomeText, findsOne);
      },
    );
  });
}
