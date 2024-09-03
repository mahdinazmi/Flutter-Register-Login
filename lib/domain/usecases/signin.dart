import 'package:auth/core/usecase/usecase.dart';
import 'package:auth/data/models/signin_req_params.dart';
import 'package:auth/domain/repository/auth.dart';
import 'package:auth/service_locator.dart';
import 'package:dartz/dartz.dart';

class SigninUseCase implements UseCase<Either, SigninReqParams> {

  @override
  Future<Either> call({SigninReqParams ? param}) async {
    return sl<AuthRepository>().signin(param!);
  }
  
}