import 'package:bloc_test/bloc_test.dart';
import 'package:chat/features/auth/bloc/login_bloc.dart';
import 'package:chat/features/auth/data/auth_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginBloc', () {
    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginSuccess] when correct credentials given',
      build: () => LoginBloc(FakeAuthRepository()),
      act: (bloc) => bloc.add(LoginButtonPressed("flutter", "flutter")),
      wait: const Duration(seconds: 3),
      expect: () => [isA<LoginLoading>(), isA<LoginSuccess>()],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoading, LoginFailure] when wrong credentials given',
      build: () => LoginBloc(FakeAuthRepository()),
      act: (bloc) => bloc.add(LoginButtonPressed("wrong", "user")),
      wait: const Duration(seconds: 3),
      expect: () => [isA<LoginLoading>(), isA<LoginFailure>()],
    );

  });
}
