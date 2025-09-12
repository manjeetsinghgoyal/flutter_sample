import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/auth_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc(this.authRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        final result = await authRepository.login(
          event.userName,
          event.password,
        );
        if (result) {
          emit(LoginSuccess());
        } else {
          emit(LoginFailure());
        }
      } catch (_) {
        emit(LoginFailure());
      }
    });
  }
}