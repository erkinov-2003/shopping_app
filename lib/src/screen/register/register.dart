import 'package:flutter/material.dart';
import 'package:shopping_app/src/screen/sign_in/sign_in_screen.dart';

import '../sign_up/sign_up.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool switchAccount = true;

  void switchButton(){
    setState(() {
      switchAccount = ! switchAccount;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(switchAccount){
      return SignInScreen(onTap: switchButton);
    }else{
      return SignUpScreen(onTap: switchButton);
    }
  }
}
