import 'package:flutter/material.dart';
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
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      ///login
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
        await PreferencesManager().setBool("is_login", true);
        setState(() {
          isLoading = false;
          errorMessage = "email or password wrong";
        });
        return;
      }
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
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/news_logo.png",
                      height: 46,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Welcome to Newts",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: LightColor.darkColor,
                      fontFamily: "Times New Roman",
                    ),
                  ),
                  const SizedBox(height: 16),
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
                  const SizedBox(height: 12),
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
                  SizedBox(height: 20),
                  if (errorMessage != null && errorMessage!.isNotEmpty)
                    Padding(
                      padding: EdgeInsetsGeometry.all(4),
                      child: Text(
                        errorMessage ?? "",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 48),
                    ),
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
                  SizedBox(height: 34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don’t have an account ?",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: LightColor.blackColor,
                        ),
                      ),
                      SizedBox(width: 8),
                      TextButton(
                        onPressed: () => signUp(context),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 14,
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

  void signUp(BuildContext context) {
    ///signup
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegisterScreen()),
    );
  }
}
