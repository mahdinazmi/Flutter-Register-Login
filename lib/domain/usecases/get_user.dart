import 'package:auth/core/usecase/usecase.dart';
import 'package:auth/domain/repository/auth.dart';
import 'package:auth/service_locator.dart';
import 'package:dartz/dartz.dart';

class GetUserUseCase implements UseCase<Either, dynamic> {

  @override
  Future<Either> call({dynamic param}) async {
    return sl<AuthRepository>().getUser();
  }
  
}