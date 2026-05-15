import 'package:flutter/material.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/data_source/local/preferences_manager.dart';
import 'package:today_news/core/widgets/custom_text_form_field.dart';
import 'package:today_news/feature/main/main_screen.dart';

import '../../core/theme/light_color.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final TextEditingController confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? errorMessage;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
    confirmPassword.dispose();
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      ///register
      setState(() {
        errorMessage = null;

        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1));
      final savedEmail = PreferencesManager().getString("email");
      if (savedEmail != null && savedEmail == email.text.trim()) {
        setState(() {
          errorMessage = "email is already exist";

          isLoading = false;
        });
      } else {
        await PreferencesManager().setBool("is_login", true);
        await PreferencesManager().setString("email", email.text.trim());
        await PreferencesManager().setString("password", password.text.trim());
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
      }
    }
  }

  void signIn(BuildContext context) {
    /// navigate to signin
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/news_background.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: AppSize.ph16,
              horizontal: AppSize.pw16,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/news_logo.png",
                      height: AppSize.h46,
                    ),
                  ),
                  SizedBox(height: AppSize.ph24),
                  Text(
                    "Welcome to Newts",
                    style: TextStyle(
                      fontSize: AppSize.sp20,
                      fontWeight: FontWeight.w700,
                      color: LightColor.darkColor,
                      fontFamily: "Times New Roman",
                    ),
                  ),
                  SizedBox(height: AppSize.ph16),
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
                    title: "Password",
                    controller: password,
                    hintText: "*************",
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter password";
                      }

                      final RegExp passwordRegex = RegExp(
                        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$',
                      );

                      if (!passwordRegex.hasMatch(value)) {
                        return "Password must contain uppercase, lowercase, number and special character";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: AppSize.ph12),
                  CustomTextFormField(
                    title: "Confirm Password",
                    controller: confirmPassword,
                    hintText: "*************",
                    isObscure: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter confirm password";
                      }

                      if (value != password.text) {
                        return "confirm password doesnt match password";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: AppSize.ph20),
                  if (errorMessage != null && errorMessage!.isNotEmpty)
                    Padding(
                      padding: EdgeInsetsGeometry.all(8),
                      child: Text(
                        errorMessage ?? "",
                        style: TextStyle(
                          fontSize: AppSize.sp16,
                          color: Colors.red,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: register,

                    child: isLoading
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Sign Up",
                            style: TextStyle(
                              fontSize: AppSize.sp16,
                              fontWeight: FontWeight.w400,
                              color: LightColor.whiteColor,
                            ),
                          ),
                  ),
                  SizedBox(height: AppSize.ph34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Have an account ?",
                        style: TextStyle(
                          fontSize: AppSize.sp14,
                          fontWeight: FontWeight.w400,
                          color: LightColor.blackColor,
                        ),
                      ),
                      SizedBox(width: AppSize.pw8),
                      TextButton(
                        onPressed: () => signIn(context),
                        child: Text(
                          "Sign In",
                          style: TextStyle(
                            fontSize: AppSize.sp14,
                            fontWeight: FontWeight.w400,
                            color: LightColor.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
