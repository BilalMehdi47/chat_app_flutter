import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  final String? token;

  UserModel({
    super.name,
    super.email,
    super.password,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>?;

    return UserModel(
      name: json['name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      token: data?['access_token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
