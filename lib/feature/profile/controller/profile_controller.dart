import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:today_news/core/data_source/local/user_repository.dart';
import 'package:today_news/core/mixin/safe_notify_mixin.dart';
import 'package:today_news/core/models/user_model.dart';

class ProfileController extends ChangeNotifier with SafeNotifyMixin {
  XFile? selectedImage;
  String? username;
  String? countryName;
  String? countryCode;
  void pickImage({required ImageSource source}) async {
    selectedImage = await ImagePicker().pickImage(source: source);
    safeNotify();
  }

  void getUserData() {
    final UserModel? user = UserRepository().getUser();
    username = user?.name ?? "";
    countryCode = user?.countryCode;
    countryName = user?.countryName;
    safeNotify();
  }

  void saveCountry(Country selectedCountry) async {
    await UserRepository().updateUser(
      countryName: selectedCountry.name,
      countryCode: selectedCountry.countryCode,
    );
    countryName = selectedCountry.name;
    countryCode = selectedCountry.countryCode;
    safeNotify();
  }
}
