class LoginRequest {
  final String email;
  final String password;

  const LoginRequest({
    required this.password, 
    required this.email
  });

  Map<String, dynamic> toJson (){
    return {"email" : email, "password" : password};
  }
}