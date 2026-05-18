import 'package:hive_ce_flutter/adapters.dart';
import 'package:today_news/core/constant/constant.dart';
import 'package:today_news/core/models/user_model.dart';

class UserRepository {
  UserRepository._internal();
  static final UserRepository _instance = UserRepository._internal();
  factory UserRepository() => _instance;

  Box<UserModel>? _userBox;
  Box<UserModel> get userBox {
    if (_userBox == null) {
      throw Exception("userBox is not initialized");
    }
    return _userBox!;
  }

  init() async {
    await Hive.initFlutter();

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(UserModelAdapter());
    }

    _userBox = await Hive.openBox<UserModel>(Constant.userBox);
  }

  Future<void> saveUser(UserModel user) async {
    await userBox.put(Constant.currentUser, user);
  }

  Future<void> clearUser() async {
    await userBox.clear();
  }

  getUser() => userBox.get(Constant.currentUser);
  updateUser({
    String? name,
    String? email,
    String? password,
    String? countryCode,
    String? countryName,
  }) async {
    final user = userBox.get(Constant.currentUser);
    if (user != null) {
      final updatedUser = user.copyWith(
        name: name,
        email: email,
        password: password,
        countryCode: countryCode,
        countryName: countryName,
      );
      await saveUser(updatedUser);
    }
  }

  void deleteUser() {
    userBox.delete(Constant.currentUser);
  }

  String? login({required String email, required String password}) {
    final user = getUser();
    if (user == null) {
      return "user not found";
    }
    if (user.email != email || user.password != password) {
      return "email or password wrong";
    }
    return null;
  }

  Future<String?> register({
    required String email,
    required String password,
    required String name,
  }) async {
    final user = getUser();
    if (user != null) {
      return "user already exist";
    }
    final newUser = UserModel(name: name, email: email, password: password);
    await saveUser(newUser);
    return null;
  }
}
