class AuthData {
  String userId;
  String? username;
  String email;
  String refreshToken;
  String token;

  AuthData({
    this.username,
    required this.email,
    required this.refreshToken,
    required this.token,
    required this.userId,
});
  factory AuthData.fromJson(Map<String, dynamic> json){
    return AuthData(
        username: json['displayName'],
        email: json['email'],
        refreshToken: json['refreshToken'],
        token: json['idToken'],
        userId: json['localId']
    );
  }
}