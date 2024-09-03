// ignore_for_file: public_member_api_docs, sort_constructors_first

class SigninReqParams {
  final String email;
  final String password;

  SigninReqParams({
    required this.email, 
    required this.password
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

}
