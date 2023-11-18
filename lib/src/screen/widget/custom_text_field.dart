import 'package:flutter/material.dart';
import 'package:shopping_app/src/common/constant/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.counterText,
    required this.controller,
    this.suffixIcon,
    required this.obscureText,
    this.keyboardType,
  });

  final String hintText;
  final String? counterText;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColor.grey,
              fontWeight: FontWeight.w500,
            ),
        suffixIcon: suffixIcon,
        counterText: counterText,
        filled: true,
        fillColor: const Color(0xFFF7F8F9),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColor.black, width: 0.6),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFF7F8F9),
          ),
        ),
      ),
    );
  }
}
