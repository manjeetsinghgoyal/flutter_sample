import 'package:chat/login_repository.dart';
import 'package:chat/loginevent.dart';
import 'package:chat/loginstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{

  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository): super(LoginInitial()){

    on<LoginButtonPressed>((event,emit) async{
      emit(LoginLoading());
      try{
        bool result = await loginRepository.login(event.username, event.password);
        if(result){
          emit(LoginSuccess());
        }
      }
      catch(e){
        emit(LoginFailure(e.toString()));
      }
    });
  }
}