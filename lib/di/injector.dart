import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import '../data/datasources/auth_remote_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/usecases/login_usecase.dart';
import '../presentation/bloc/login/login_bloc.dart';
import '../presentation/mvvm/login_viewmodel.dart';


final GetIt sl = GetIt.instance;


Future<void> init() async {
// External
  sl.registerLazySingleton(() => http.Client());


// Data sources
  sl.registerLazySingleton<AuthRemoteDataSource>(() =>
      AuthRemoteDataSourceImpl(client: sl()));


// Repositories
  sl.registerLazySingleton(() => AuthRepositoryImpl(remote: sl()));


// Use cases
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));


// Presentation
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));


// MVVM
  sl.registerFactory(() => LoginViewModel(sl()));
}