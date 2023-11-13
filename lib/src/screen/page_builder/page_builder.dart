import 'package:flutter/material.dart';
import 'package:shopping_app/src/common/constant/app_icons.dart';
import 'package:shopping_app/src/screen/favorite/favorite_screen.dart';
import 'package:shopping_app/src/screen/home/home_screen.dart';
import 'package:shopping_app/src/screen/order/order_screen.dart';
import 'package:shopping_app/src/screen/profile/profile_screen.dart';
import 'package:shopping_app/src/screen/widget/bottom_item.dart';

class PageBuilder extends StatefulWidget {
  const PageBuilder({super.key});

  @override
  State<PageBuilder> createState() => _PageBuilderState();
}

class _PageBuilderState extends State<PageBuilder> {
  late final PageController controller;

  @override
  void initState() {
    controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onTap(int value) {
    controller.animateToPage(
      value,
      duration: const Duration(milliseconds: 150),
      curve: Curves.linear,
    );
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(45),
          ),
          child: BottomAppBar(
            color: Colors.black,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomBottomItem(
                  currentPage: 0,
                  index: index,
                  assetImages: AppIcons.homeIcon,
                  onTap: () {
                    setState(() {
                      onTap(index = 0);
                    });
                  },
                ),
                CustomBottomItem(
                  assetImages: AppIcons.saleIcon,
                  currentPage: 1,
                  index: index,
                  onTap: () {
                    setState(() {
                      onTap(index = 1);
                    });
                  },
                ),
                CustomBottomItem(
                  assetImages: AppIcons.favoriteIcon,
                  index: index,
                  currentPage: 2,
                  onTap: () {
                    setState(() {
                      onTap(index = 2);
                    });
                  },
                ),
                CustomBottomItem(
                  index: index,
                  currentPage: 3,
                  assetImages: AppIcons.profileIcon,
                  onTap: () {
                    setState(() {
                      onTap(index = 3);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: const [
          HomeScreen(),
          OrderScreen(),
          FavoriteScreen(),
          ProfileScreen(),
        ],
      ),
    );
  }
}
