import 'package:auth/data/models/signin_req_params.dart';
import 'package:auth/data/models/signup_req_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  
  Future<Either> signup(SignupReqParams signupReq);
  Future<Either> signin(SigninReqParams signinReq);
  Future<bool> isLoggedIn();
  Future<Either> getUser();
  Future<Either> logout();
}