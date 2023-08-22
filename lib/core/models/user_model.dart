class UserModel {
  final String email;
  final String? token;

  UserModel({
    required this.email,
    this.token,
  });

  UserModel copyWith({String? newEmail, String? newToken}) {
    return UserModel(
      email: newEmail ?? email,
      token: newToken ?? token,
    );
  }
}
