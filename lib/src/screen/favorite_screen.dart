
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/src/controller/provider.dart';

import '../common/constant/app_colors.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteList = Provider.of<MainController>(context).favoriteList;
    final deleteList = Provider.of<MainController>(context).removeProduct;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
          child: favoriteList.isEmpty
              ? Center(
                  child: Text(
                    "Favorite isEmpty...",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                )
              : ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) {
                    return const Divider(height: 5, color: Colors.black);
                  },
                  itemBuilder: (context, index) {
                    final favorite = favoriteList[index];
                    return Slidable(
                      direction: Axis.horizontal,
                      startActionPane: ActionPane(
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {
                              deleteList(favorite);
                            },
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                          ),
                        ],
                      ),
                      child: ListTile(
                        leading: const SizedBox(
                          height: 60,
                          width: 60,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        title: Text(favorite.title),
                        subtitle: Text(favorite.price),
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text(
                                      "want to delete from Favorite"),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "Now",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: AppColor.blue,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        deleteList(favorite);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        "Yes",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: AppColor.red,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.favorite,
                            color: AppColor.red,
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: favoriteList.length,
                ),
        ),
      ),
    );
  }
}
