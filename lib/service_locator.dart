
import 'package:auth/core/network/dio_client.dart';
import 'package:auth/data/repository/auth.dart';
import 'package:auth/data/source/auth_api_service.dart';
import 'package:auth/data/source/auth_local_service.dart';
import 'package:auth/domain/repository/auth.dart';
import 'package:auth/domain/usecases/get_user.dart';
import 'package:auth/domain/usecases/is_logged_in.dart';
import 'package:auth/domain/usecases/logout.dart';
import 'package:auth/domain/usecases/signin.dart';
import 'package:auth/domain/usecases/signup.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupServiceLocator() {

  sl.registerSingleton<DioClient>(DioClient());
  
  // Services
  sl.registerSingleton<AuthApiService>(
    AuthApiServiceImpl()
  );

  sl.registerSingleton<AuthLocalService>(
    AuthLocalServiceImpl()
  );

  // Repositories
  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImpl()
  );

  // Usecases
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
  );

  sl.registerSingleton<IsLoggedInUseCase>(
    IsLoggedInUseCase()
  );

  sl.registerSingleton<GetUserUseCase>(
    GetUserUseCase()
  );

  sl.registerSingleton<LogoutUseCase>(
    LogoutUseCase()
  );

  sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
  );
}