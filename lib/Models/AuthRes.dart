class AuthRes {
  final String accessToken;
  final String refreshToken;
  final String userId;
  final String username;

  AuthRes(this.accessToken, this.refreshToken, this.userId, this.username);

  factory AuthRes.fromJson(Map<String, dynamic> json) {
    return AuthRes(
      json['accessToken'],
      json['refreshToken'],
      json['userId'],
      json['username'],
    );
  }
}
