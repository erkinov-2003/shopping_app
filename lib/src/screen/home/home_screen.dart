import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shopping_app/src/common/constant/app_colors.dart';
import 'package:shopping_app/src/common/constant/app_icons.dart';
import 'package:shopping_app/src/screen/widget/custom_cart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Welcome",
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Shopping app",
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushNamed(context, "profile");
                      },
                      child: const CircleAvatar(radius: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.black, width: 0.4),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: const Icon(Icons.search),
                          hintText: "Search clothes brands",
                          hintStyle:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  height: 600,
                  child: MasonryGridView.builder(
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 10,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCard(index: index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
