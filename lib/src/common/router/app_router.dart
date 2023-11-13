import 'package:flutter/cupertino.dart';
import 'package:shopping_app/src/screen/auth_page/auth_page.dart';
import 'package:shopping_app/src/screen/home/home_screen.dart';
import 'package:shopping_app/src/screen/page_builder/page_builder.dart';
import 'package:shopping_app/src/screen/profile/profile_screen.dart';
import 'package:shopping_app/src/screen/sign_in/sign_in_screen.dart';
import 'package:shopping_app/src/screen/sign_up/sign_up.dart';

import '../../screen/register/register.dart';

class AppRouter {
  static final appRouter = {
    "home": (BuildContext context) => const HomeScreen(),
    "sign_in": (BuildContext context) => const SignInScreen(),
    "sign_up": (BuildContext context) => const SignUpScreen(),
    "register": (BuildContext context) => const RegisterScreen(),
    "authPage": (BuildContext context) => const AuthPage(),
    "pageBuilder": (BuildContext context) => const PageBuilder(),
    "profile": (BuildContext context) => const ProfileScreen(),
  };
}
