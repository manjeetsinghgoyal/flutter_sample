import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';
import '../data/auth_repository.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext buildContext) {
    final userNameController = TextEditingController();
    final passwordController = TextEditingController();

    return BlocProvider(
      create: (_) => LoginBloc(FakeAuthRepository()),
      child: Scaffold(
        appBar: AppBar(title: const Text("Login Example")),
        body: Center(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: (buildContext, state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(buildContext).showSnackBar(
                  const SnackBar(content: Text("Login Successful")),
                );
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(
                  buildContext,
                ).showSnackBar(const SnackBar(content: Text("Login Failure")));
              }
            },
            builder: (buildContext, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    TextField(
                      controller: userNameController,
                      decoration: const InputDecoration(labelText: "UserName"),
                    ),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(labelText: "Password"),
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => {
                        buildContext.read<LoginBloc>().add(
                          LoginButtonPressed(
                            userNameController.text,
                            passwordController.text,
                          ),
                        ),
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
