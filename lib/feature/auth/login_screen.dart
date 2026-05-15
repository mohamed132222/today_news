import 'package:flutter/material.dart';
import 'package:today_news/core/constant/app_size.dart';
import 'package:today_news/core/data_source/local/preferences_manager.dart';
import 'package:today_news/core/theme/light_color.dart';
import 'package:today_news/core/widgets/custom_text_form_field.dart';
import 'package:today_news/feature/auth/register_screen.dart';
import 'package:today_news/feature/main/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

  String? errorMessage;

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
        errorMessage = null;
      });

      await Future.delayed(Duration(seconds: 2));

      final savedPassword = PreferencesManager().getString("password");

      final savedEmail = PreferencesManager().getString("email");

      if (savedEmail == null || savedPassword == null) {
        setState(() {
          isLoading = false;
          errorMessage = "email dosent found";
        });

        return;
      }

      if (savedEmail != email.text.trim() ||
          savedPassword != password.text.trim()) {
        setState(() {
          isLoading = false;
          errorMessage = "email or password wrong";
        });

        return;
      }

      await PreferencesManager().setBool("is_login", true);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      );

      setState(() {
        isLoading = false;
        errorMessage = null;
      });
    }
  }

  void signUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
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
              child: Center(
                child: SingleChildScrollView(
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
                            r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
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

                      SizedBox(height: AppSize.ph20),

                      if (errorMessage != null && errorMessage!.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.pw4,
                            vertical: AppSize.ph4,
                          ),
                          child: Text(
                            errorMessage ?? "",
                            style: TextStyle(
                              fontSize: AppSize.sp16,
                              fontWeight: FontWeight.w400,
                              color: Colors.red,
                            ),
                          ),
                        ),

                      ElevatedButton(
                        onPressed: login,
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Text(
                                "Sign In",
                                style: TextStyle(
                                  fontSize: 16,
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
                            "Don’t have an account ?",
                            style: TextStyle(
                              fontSize: AppSize.sp14,
                              fontWeight: FontWeight.w400,
                              color: LightColor.blackColor,
                            ),
                          ),

                          SizedBox(width: AppSize.pw8),

                          TextButton(
                            onPressed: () => signUp(context),
                            child: Text(
                              "Sign Up",
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
        ),
      ),
    );
  }
}
