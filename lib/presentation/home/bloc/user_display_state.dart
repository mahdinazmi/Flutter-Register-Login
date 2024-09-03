import 'package:auth/domain/entities/user.dart';

abstract class UserDisplayState {}

class UserLoading extends UserDisplayState {}

class UserLoaded extends UserDisplayState {
  final UserEntity userEntity;
  UserLoaded({required this.userEntity});
}

class LoadUserFailure extends UserDisplayState {
  final String errorMessage;
  LoadUserFailure({required this.errorMessage});
}