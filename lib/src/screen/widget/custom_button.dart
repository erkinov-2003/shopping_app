import 'package:flutter/material.dart';
import 'package:shopping_app/src/common/constant/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
    this.backgroundColor,
  });

  final String text;
  final Color? backgroundColor;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        fixedSize: const Size(360, 55),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: AppColor.white,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
