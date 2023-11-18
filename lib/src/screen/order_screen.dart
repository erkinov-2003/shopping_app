import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/src/common/constant/app_colors.dart';
import 'package:shopping_app/src/controller/provider.dart';

import '../common/constant/app_icons.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({
    super.key,
    required this.title,
    required this.brends,
  });
  final String title;
  final String brends;

  @override
  Widget build(BuildContext context) {
    final productList = Provider.of<MainController>(context).orderList;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14, top: 30),
          child: productList.isEmpty
              ? Center(
                  child: Text(
                    "Order isEmpty...",
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
                    return Slidable(
                      direction: Axis.horizontal,
                      startActionPane: ActionPane(
                        motion: const BehindMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) {},
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
                        title: Text(title),
                        subtitle: Text(brends),
                        trailing: SizedBox(
                          height: 40,
                          width: 110,
                          child: DecoratedBox(
                            decoration: const BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: _build(context),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 0,
                ),
        ),
      ),
    );
  }

  Widget _build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Image(
          image: AssetImage(AppIcons.removeIcon),
          height: 25,
        ),
        Text(
          "1",
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: AppColor.white,
                fontWeight: FontWeight.w500,
              ),
        ),
        const Image(
          image: AssetImage(
            AppIcons.addIcons,
          ),
          height: 25,
        ),
      ],
    );
  }
}
