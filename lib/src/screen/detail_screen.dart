
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/src/common/constant/app_colors.dart';
import 'package:shopping_app/src/common/constant/app_icons.dart';
import 'package:shopping_app/src/controller/provider.dart';
import 'package:shopping_app/src/model/product_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
    required this.title,
    required this.price,
    required this.description,
  });
  final String title;
  final String price;
  final String description;

  @override
  Widget build(BuildContext context) {
    final favoriteList = Provider.of<MainController>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 500,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(AppIcons.arrowBack),
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text(
                                        "Add you favorite",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: AppColor.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context),
                                          child: Text(
                                            "Now",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: AppColor.red,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                        TextButton(
                                          onPressed: ()  {
                                            final productModel = ProductModel(
                                              title: title,
                                              description: description,
                                              price: price,
                                              brends: "",
                                            );
                                            favoriteList
                                                .addFavoriteList(productModel);
                                            Navigator.pop(context);

                                          },
                                          child: Text(
                                            "Yes",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(
                                                  color: AppColor.blue,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: SizedBox(
                                height: 45,
                                width: 45,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1),
                                    shape: BoxShape.circle,
                                    color: AppColor.black,
                                  ),
                                  child: const Center(
                                    child: Image(
                                      image: AssetImage(AppIcons.favoriteIcon),
                                      height: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          title,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: AppColor.green,
                                    fontWeight: FontWeight.w600,
                                  ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Text(
                      price,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.red,
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text(
                  description,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColor.black,
                        fontWeight: FontWeight.w400,
                      ),
                  maxLines: 15,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Spacer(flex: 4),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        _build(context, AppIcons.addIcons),
                        const SizedBox(width: 10),
                        const Text("1"),
                        const SizedBox(width: 10),
                        _build(context, AppIcons.removeIcon),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () => {},
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        )),
                        backgroundColor: AppColor.black,
                        fixedSize: const Size(140, 45),
                      ),
                      child: const Text("Add to Cart"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _build(BuildContext context, String images) {
    return SizedBox(
      height: 30,
      width: 30,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
        child: Center(
          child: Image(
            image: AssetImage(images),
            height: 15,
          ),
        ),
      ),
    );
  }
}
