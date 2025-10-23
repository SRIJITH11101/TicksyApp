import 'dart:convert';

class SignUpReq {
  final String username;
  final String email;
  final String password;

  SignUpReq({
    required this.username,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'name': username,
    'email': email,
    'password': password,
  };

  String toRawJson() => jsonEncode(toJson());
}
