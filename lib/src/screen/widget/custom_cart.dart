import 'package:flutter/material.dart';

import '../../common/constant/app_colors.dart';
import '../../common/constant/app_icons.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.onTap,
    required this.title,
    required this.brends,
    required this.price,
  });
  final void Function()? onTap;
  final String title;
  final String brends;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 220,
          width: 240,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 100, top: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: const SizedBox(
                      height: 35,
                      width: 35,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.black,
                        ),
                        child: Center(
                          child: Image(
                            image: AssetImage(AppIcons.addIcons),
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          brends,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          price,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
        ),
      ],
    );
  }
}
