import 'package:first_test_project/helper/validations.dart';
import 'package:first_test_project/screens/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCTL = TextEditingController();
  final TextEditingController passwordCTL = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
      ),
      body: Form(
        key: loginFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey("email_id"),
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                controller: emailCTL,
                validator: (value) => Validations.validateEmail(value ?? ""),
              ),
              TextFormField(
                key: const ValueKey("password_id"),
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                ),
                controller: passwordCTL,
                validator: (value) => Validations.validatePassword(value ?? ""),
                obscureText: true,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          if (loginFormKey.currentState?.validate() == true) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );
          }
        },
        child: const Text("Đăng nhập"),
      ),
    );
  }
}
