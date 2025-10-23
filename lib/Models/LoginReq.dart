import 'dart:convert';

class LoginReq {
  final String email;
  final String password;

  LoginReq({required this.email, required this.password});

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  String toRawJson() => jsonEncode(toJson());
}
