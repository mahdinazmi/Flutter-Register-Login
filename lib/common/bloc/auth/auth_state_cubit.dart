import 'package:auth/common/bloc/auth/auth_state.dart';
import 'package:auth/domain/usecases/is_logged_in.dart';
import 'package:auth/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthStateCubit extends Cubit<AuthState> {

  AuthStateCubit() : super(AppInitialState());
  
  void appStarted() async {
    var isLoggedIn = await sl<IsLoggedInUseCase>().call();
    if (isLoggedIn) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }

}