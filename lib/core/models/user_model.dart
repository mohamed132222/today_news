import 'package:hive_ce_flutter/adapters.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? email;
  @HiveField(2)
  final String? password;
  @HiveField(3)
  final String? countryCode;
  @HiveField(4)
  final String? countryName;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    this.countryCode,
    this.countryName,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    name: json["name"],
    email: json["email"],
    password: json["password"],
    countryCode: json["countryCode"],
    countryName: json["countryName"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "countryCode": countryCode,
    "countryName": countryName,
  };

  @override
  String toString() {
    return 'UserModel(name: $name, email: $email, password: $password, countryCode: $countryCode, countryName: $countryName)';
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? countryCode,
    String? countryName,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      countryCode: countryCode ?? this.countryCode,
      countryName: countryName ?? this.countryName,
    );
  }
}
