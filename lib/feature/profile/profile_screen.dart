import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/data_source/local/preferences_manager.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/core/widgets/custom_svg_picture.dart';
import 'package:today_news/feature/auth/login_screen.dart';
import 'package:today_news/feature/profile/bottom_sheets/personal_info_bottom_sheet.dart';
import 'package:today_news/feature/profile/controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProfileController>(
      create: (context) => ProfileController()..getUserData(),
      child: Scaffold(
        appBar: AppBar(title: Text("Profile Screen")),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.pw16,
            vertical: AppSize.ph20,
          ),
          child: Consumer<ProfileController>(
            builder: (context, controller, child) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          width: AppSize.w110,
                          height: AppSize.h110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.r100),
                            border: Border.all(
                              color: Color(0xFFD1DAD6),
                              width: 1,
                            ),
                            image: DecorationImage(
                              image: controller.selectedImage == null
                                  ? AssetImage(
                                      "assets/images/Leading element.png",
                                    )
                                  : FileImage(
                                      File(controller.selectedImage!.path),
                                    ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          child: GestureDetector(
                            onTap: () {
                              showImagePicker(context);
                            },
                            child: Container(
                              height: AppSize.h34,
                              width: AppSize.w34,
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(
                                  AppSize.r100,
                                ),
                                border: Border.all(
                                  color: Color(0xFFD1DAD6),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: Color(0xFF161F1B),
                                size: AppSize.r20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.ph8),
                    Text(
                      controller.username ??
                          PreferencesManager().getString("username") ??
                          "",
                      style: TextStyle(
                        fontSize: AppSize.sp16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF161F1B),
                        fontFamily: "Times New Roman",
                      ),
                    ),
                    SizedBox(height: AppSize.ph16),

                    _buildProfileItem(
                      title: "Personal Info",
                      imagePath: "person_icon.svg",
                      onTap: () async {
                        showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return PersonalInfoBottomSheet();
                          },
                        ).then((value) => controller.getUserData());
                      },
                    ),
                    _buildProfileItem(
                      title: "Language",
                      imagePath: "language_icon.svg",
                      onTap: () {},
                    ),
                    _buildProfileItem(
                      title: controller.countryName ?? "Country",
                      imagePath: "country_icon.svg",
                      onTap: () {
                        showCountryPicker(
                          context: context,
                          showPhoneCode: false,
                          onSelect: (Country country) {
                            controller.saveCountry(country);
                          },
                        );
                      },
                    ),
                    _buildProfileItem(
                      title: "Terms & Conditions",
                      imagePath: "terms_conditions_icon.svg",
                      onTap: () {},
                    ),
                    _buildProfileItem(
                      title: "Logout",
                      imagePath: "logout_icon.svg",
                      onTap: () {
                        PreferencesManager().clear();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      color: LightColor.primaryColor,
                      hasDivider: false,
                      svgColor: true,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required String title,
    required String imagePath,
    required Function onTap,
    Color color = const Color(0xFF161F1B),
    bool svgColor = false,
    bool hasDivider = true,
  }) {
    return Column(
      children: [
        ListTile(
          onTap: () => onTap(),
          contentPadding: EdgeInsets.zero,
          leading: CustomSvgPicture.withOutFilterColor(imgPath: imagePath),
          title: Text(
            title,
            style: TextStyle(
              fontSize: AppSize.sp16,
              fontWeight: FontWeight.w400,
              color: color,
              fontFamily: "Times New Roman",
            ),
          ),
          trailing: CustomSvgPicture(
            imgPath: "arrow_forward_icon.svg",
            withFilterColor: svgColor,
          ),
        ),
        if (hasDivider) Divider(color: Color(0xFFD1DAD6), thickness: 1.5),
      ],
    );
  }
}

Future<void> showImagePicker(BuildContext context) async {
  final controller = context.read<ProfileController>();
  showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      title: Text(
        "Selected Image Source",
        style: TextStyle(
          fontSize: AppSize.sp20,
          fontWeight: FontWeight.w400,
          color: Color(0xFF161F1B),
          fontFamily: "Poppins",
        ),
      ),
      children: [
        SimpleDialogOption(
          onPressed: () async {
            Navigator.pop(context);
            controller.pickImage(source: ImageSource.gallery);
          },
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.pw16,
            vertical: AppSize.ph16,
          ),
          child: Row(
            children: [
              Icon(Icons.image),
              SizedBox(width: AppSize.pw16),
              Text("Gallery"),
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: () async {
            Navigator.pop(context);
            controller.pickImage(source: ImageSource.camera);
          },
          padding: EdgeInsets.symmetric(
            horizontal: AppSize.pw16,
            vertical: AppSize.ph16,
          ),
          child: Row(
            children: [
              Icon(Icons.camera_alt),
              SizedBox(width: AppSize.pw16),
              Text("Camera"),
            ],
          ),
        ),
      ],
    ),
  );
}
