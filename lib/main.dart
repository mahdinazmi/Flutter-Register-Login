import 'package:auth/common/bloc/auth/auth_state_cubit.dart';
import 'package:auth/presentation/home/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common/bloc/auth/auth_state.dart';
import 'core/configs/theme/app_theme.dart';
import 'presentation/auth/pages/signup.dart';
import 'service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.black
    )
  );
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);
    return BlocProvider(
      create: (context) => AuthStateCubit()..appStarted(),
      child: MaterialApp(
          theme: AppTheme.appTheme,
          debugShowCheckedModeBanner: false,
          home: BlocBuilder<AuthStateCubit,AuthState>(
            builder: (context, state) {
              if (state is Authenticated){
                return const HomePage();
              }
              if (state is UnAuthenticated){
                return SignupPage();
              }
              return Container();
            },
          )
        ),
    );
  }
}