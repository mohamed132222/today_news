import 'package:flutter/material.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/data_source/local/user_repository.dart';
import 'package:today_news/core/models/user_model.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/core/widgets/custom_text_form_field.dart';

class PersonalInfoBottomSheet extends StatefulWidget {
  const PersonalInfoBottomSheet({super.key});

  @override
  State<PersonalInfoBottomSheet> createState() =>
      _PersonalInfoBottomSheetState();
}

class _PersonalInfoBottomSheetState extends State<PersonalInfoBottomSheet> {
  final TextEditingController email = TextEditingController();
  final TextEditingController username = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() {
    final UserModel? user = UserRepository().getUser();
    // Correct mapping: email to email, name to username controller
    email.text = user?.email ?? "";
    username.text = user?.name ?? "";
  }

  void _saveData() async {
    await UserRepository().updateUser(email: email.text, name: username.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .5,
      decoration: BoxDecoration(
        color: const Color(0xFFF0F0F0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.r24),
          topRight: Radius.circular(AppSize.r24),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSize.pw16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: AppSize.h4,
                    width: AppSize.w34,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSize.r100),
                      color: LightColor.darkColor,
                    ),
                  ),
                ),
                SizedBox(height: AppSize.ph24),
                Text(
                  "Profile Info",
                  style: TextStyle(
                    fontSize: AppSize.sp16,
                    fontWeight: FontWeight.w400,
                    color: LightColor.blackColor,
                    fontFamily: "Times New Roman",
                  ),
                ),
                SizedBox(height: AppSize.ph24),
                CustomTextFormField(
                  title: "Email",
                  controller: email,
                  hintText: "usama@gmail.com",
                  textInputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your email";
                    }
                    final RegExp emailRegex = RegExp(
                      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return "Enter valid email";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.ph12),
                CustomTextFormField(
                  title: "Username",
                  controller: username,
                  hintText: "Mohamed Abdou",
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter your name";
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSize.ph34),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      _saveData();
                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Save"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
