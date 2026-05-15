import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:today_news/core/data_source/local/preferences_manager.dart';
import 'package:today_news/core/mixin/safe_notify_mixin.dart';

class ProfileController extends ChangeNotifier with SafeNotifyMixin {
  XFile? selectedImage;
  String? username;
  String? countryName;
  String? countryCode;
  void pickImage({required ImageSource source}) async {
    selectedImage = await ImagePicker().pickImage(source: source);
    safeNotify();
  }

  getUserData() {
    username = PreferencesManager().getString("username");
    countryCode = PreferencesManager().getString("country_code");
    countryName = PreferencesManager().getString("country_name");
    safeNotify();
  }

  void saveCountry(Country selectedCountry) async {
    await PreferencesManager().setString("country_name", selectedCountry.name);
    await PreferencesManager().setString(
      "country_code",
      selectedCountry.countryCode,
    );
    countryName = selectedCountry.name;
    countryCode = selectedCountry.countryCode;
    safeNotify();
  }
}
