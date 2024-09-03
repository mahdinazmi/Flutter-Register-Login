import 'package:auth/common/bloc/button/button_state_cubit.dart';
import 'package:auth/common/widgets/button/basic_app_button.dart';
import 'package:auth/domain/entities/user.dart';
import 'package:auth/domain/usecases/logout.dart';
import 'package:auth/presentation/auth/pages/signup.dart';
import 'package:auth/presentation/home/bloc/user_display_cubit.dart';
import 'package:auth/presentation/home/bloc/user_display_state.dart';
import 'package:auth/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/button/button_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserDisplayCubit()..displayUser()),
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
        child: BlocListener<ButtonStateCubit,ButtonState>(
          listener: (context, state) {
            if (state is ButtonSuccessState){
              Navigator.pushReplacement(
               context, 
               MaterialPageRoute(builder: (context) => SignupPage(),)
             );
            }
          },
          child: Center(
            child: BlocBuilder<UserDisplayCubit,UserDisplayState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is UserLoaded) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _username(state.userEntity),
                      const SizedBox(height: 10, ),
                      _email(state.userEntity),
                      _logout(context)
                    ],
                  );
                }
                if (state is LoadUserFailure){
                  return Text(state.errorMessage);
                }
                return Container();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _username(UserEntity user) {
    return Text(
      user.username,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
    );
  }

   Widget _email(UserEntity user) {
    return Text(
      user.email,
       style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 19
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: BasicAppButton(
        title: 'Logout',
        onPressed: (){
         context.read<ButtonStateCubit>().excute(
          usecase: sl<LogoutUseCase>()
         );
        }
      ),
    );
  }
}