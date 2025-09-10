import 'package:chat/login_repository.dart';
import 'package:chat/loginbloc.dart';
import 'package:chat/loginevent.dart';
import 'package:chat/loginstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController textUserNameController = TextEditingController();
  final TextEditingController textPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(LoginRepository()),
      child: Scaffold(
        appBar: AppBar(title: Text("Login Form")),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              if (state is LoginLoading) {
                return Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  TextField(
                    controller: textUserNameController,
                    decoration: InputDecoration(labelText: "UserName"),
                  ),
                  TextField(
                    controller: textPasswordController,
                    decoration: InputDecoration(labelText: "Password"),
                    obscureText: true,
                  ),
                  SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      final username = textUserNameController.text;
                      final password = textPasswordController.text;
                      context.read<LoginBloc>().add(
                        LoginButtonPressed(username, password),
                      );
                    },
                    child: Text("Login"),
                  ),
                ],
              );
            },
            listener: (BuildContext context, LoginState state) {
              if (state is LoginSuccess) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text("Login Successfully.")));
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
          ),
        ),
      ),
    );
  }
}
