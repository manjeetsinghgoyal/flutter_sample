import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/label_widget.dart';
import '../../mvvm/login_viewmodel.dart';

class LoginPageMVVM extends StatefulWidget {
  const LoginPageMVVM({super.key});

  @override
  State<LoginPageMVVM> createState() => _LoginPageMVVMState();
}

class _LoginPageMVVMState extends State<LoginPageMVVM> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Login (MVVM)')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const LabelWidget(text: "User Id"),
              const SizedBox(height: 6),
              CustomTextField(
                controller: _usernameController,
                hintText: 'Enter User Id',
                icon: Icons.person,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter User Id';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const LabelWidget(text: "Password"),
              const SizedBox(height: 6),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Enter Password',
                icon: Icons.lock,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length < 4) {
                    return 'Password must be at least 4 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),
              vm.isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                      text: 'LOGIN',
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          final error = await vm.login(
                            _usernameController.text,
                            _passwordController.text,
                          );
                          if (error == null) {
                            Navigator.pushReplacementNamed(
                              context,
                              '/dashboard',
                            );
                          } else {
                            ScaffoldMessenger.of(
                              context,
                            ).showSnackBar(SnackBar(content: Text(error)));
                          }
                        }
                      },
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
