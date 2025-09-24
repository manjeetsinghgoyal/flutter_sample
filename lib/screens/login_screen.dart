import 'package:flutter/material.dart';

import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = AuthService();
  String message = "";

  void login() async {
    final success = await authService.login(
      emailController.text,
      passwordController.text,
    );

    setState(() {
      message = success? 'Welcome' : 'Invalid credentials';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(key: const Key('email'), controller: emailController),

            TextField(
              key: const Key('password'),
              controller: passwordController,
            ),
            ElevatedButton(
              key: const Key('loginButton'),
              onPressed: login,
              child: const Text("Login"),
            ),
            Text(message, key: const Key('message')),
          ],
        ),
      ),
    );
  }
}
