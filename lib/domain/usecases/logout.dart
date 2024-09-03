import 'package:auth/core/usecase/usecase.dart';
import 'package:auth/domain/repository/auth.dart';
import 'package:auth/service_locator.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({param}) async {
    return await sl<AuthRepository>().logout();
  }

}