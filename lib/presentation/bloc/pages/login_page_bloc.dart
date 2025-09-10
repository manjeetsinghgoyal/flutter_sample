import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login/login_bloc.dart';
import '../login/login_event.dart';
import '../login/login_state.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class LoginPageBloc extends StatefulWidget {
  const LoginPageBloc({Key? key}) : super(key: key);

  @override
  State<LoginPageBloc> createState() => _LoginPageBlocState();
}

class _LoginPageBlocState extends State<LoginPageBloc> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login (BLoC)'),
        centerTitle: true,
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state.status == FormStatus.success) {
            Navigator.pushReplacementNamed(context, '/dashboard');
          } else if (state.status == FormStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message ?? 'Login failed')),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    controller: _usernameController,
                    hintText: 'User Id',
                    icon: Icons.person,
                    onChanged: (val) => context
                        .read<LoginBloc>()
                        .add(LoginUsernameChanged(val)),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter User Id';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    onChanged: (val) => context
                        .read<LoginBloc>()
                        .add(LoginPasswordChanged(val)),
                    validator: (value) {
                      if (value == null || value.length < 4) {
                        return 'Password must be at least 4 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 24),
                  state.status == FormStatus.submitting
                      ? const CircularProgressIndicator()
                      : CustomButton(
                    text: 'LOGIN',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<LoginBloc>().add(LoginSubmitted());
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
