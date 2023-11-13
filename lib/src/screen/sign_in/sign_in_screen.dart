import 'package:flutter/material.dart';
import 'package:shopping_app/src/common/constant/app_colors.dart';
import 'package:shopping_app/src/common/exception/custom_exception.dart';
import 'package:shopping_app/src/screen/widget/custom_button.dart';
import 'package:shopping_app/src/screen/widget/custom_text_field.dart';
import 'package:shopping_app/src/service/auth_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void signInWith() {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please don't leave a head."),
        ),
      );
    }

    try {
      AuthService().signIn(emailController.text, passwordController.text);
    } catch (e) {
      customDisplayException(e.toString(), context);
    }
  }

  bool showPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Text(
                "Welcome back! Glad\nto see you, Again!",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: AppColor.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 35),
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
                obscureText: false,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: passwordController,
                hintText: "Enter your password",
                counterText: "Forgot password?",
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: showPassword
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility),
                ),
                obscureText: showPassword,
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Sign In",
                onPressed: () => signInWith,
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
                      "Sign Up",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.blue,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
