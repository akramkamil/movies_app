class User {
  final String userId;
  final String username;
  final String email;
  final String password;
  final String phoneNumber;

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json, String id) {
    return User(
        userId: json['id'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        phoneNumber: json['phoneNumber']
    );
  }
}
