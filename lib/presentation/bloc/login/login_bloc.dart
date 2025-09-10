import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';
import '../../../domain/usecases/login_usecase.dart';
import '../../../core/exceptions.dart';


class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase loginUseCase;
  LoginBloc({required this.loginUseCase}) : super(LoginState()) {
    on<LoginUsernameChanged>((event, emit) {
      final newState = state.copyWith(username: event.username);
      emit(newState.copyWith(status: _validate(newState)));
    });


    on<LoginPasswordChanged>((event, emit) {
      final newState = state.copyWith(password: event.password);
      emit(newState.copyWith(status: _validate(newState)));
    });


    on<LoginSubmitted>((event, emit) async {
      if (_validate(state) != FormStatus.valid) {
        emit(state.copyWith(status: FormStatus.invalid));
        return;
      }
      emit(state.copyWith(status: FormStatus.submitting));
      try {
        final resp = await loginUseCase(state.username, state.password);
        if (resp.status.toLowerCase() == 'success') {
          emit(state.copyWith(status: FormStatus.success, message: resp.message));
        } else {
          emit(state.copyWith(status: FormStatus.failure, message: resp.message));
        }
      } catch (e) {
        if (e is ServerException) {
          emit(state.copyWith(status: FormStatus.failure, message: e.message));
        } else {
          emit(state.copyWith(status: FormStatus.failure, message: 'Unknown error'));
        }
      }
    });
  }


  FormStatus _validate(LoginState s) {
    if (s.username.trim().isNotEmpty && s.password.trim().length >= 4) return FormStatus.valid;
    return FormStatus.invalid;
  }
}