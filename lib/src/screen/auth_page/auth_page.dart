import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/src/screen/page_builder/page_builder.dart';
import 'package:shopping_app/src/screen/register/register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const PageBuilder();
        } else {
          return const RegisterScreen();
        }
      },
    );
  }
}
