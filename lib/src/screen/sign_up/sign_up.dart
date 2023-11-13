import 'package:flutter/material.dart';
import 'package:shopping_app/src/common/exception/custom_exception.dart';
import 'package:shopping_app/src/screen/widget/custom_button.dart';
import 'package:shopping_app/src/screen/widget/custom_text_field.dart';
import 'package:shopping_app/src/service/auth_service.dart';

import '../../common/constant/app_colors.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key, this.onTap});
  final void Function()? onTap;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPassword;

  @override
  void initState() {
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassword = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    super.dispose();
  }

  void signUpWith() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    if (passwordController.text != confirmPassword.text) {
      Navigator.pop(context);
      return customDisplayException(
        "Your password should be hato or the same",
        context,
      );
    }

    if (userNameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty ||
        confirmPassword.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("please don't leave a head."),
        ),
      );
    }

    try {
      AuthService().signUp(emailController.text, passwordController.text);
      Navigator.pop(context);
    } catch (e) {
      customDisplayException(e.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Hello! Register to get\nstarted",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 35),
              CustomTextField(
                hintText: "Username",
                controller: userNameController,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Email address",
                controller: emailController,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Password",
                controller: passwordController,
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: "Confirm password",
                controller: confirmPassword,
                obscureText: false,
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                text: "Sign Up",
                onPressed: () => signUpWith,
                backgroundColor: Colors.black,
              ),
              const SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have on account  ",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColor.black,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.blue,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
