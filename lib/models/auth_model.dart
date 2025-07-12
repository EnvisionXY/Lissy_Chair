class AuthModel {
  final String email;
  final String token;

  AuthModel({required this.email, required this.token});

  // Factory method to create an instance from JSON
  factory AuthModel.fromJson(Map<String, dynamic> json, String email) {
    return AuthModel(
      email: email,
      token: json['token'],
    );
  }
}
