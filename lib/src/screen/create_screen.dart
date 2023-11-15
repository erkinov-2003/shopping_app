import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/src/common/constant/app_icons.dart';
import 'package:shopping_app/src/controller/provider.dart';
import 'package:shopping_app/src/model/product_model.dart';
import 'package:shopping_app/src/screen/widget/custom_button.dart';
import 'package:shopping_app/src/screen/widget/custom_text_field.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late final TextEditingController titleController;
  late final TextEditingController brendController;
  late final TextEditingController descriptionController;
  late final TextEditingController priceController;

  final firebaseDatabase = FirebaseFirestore.instance;

  @override
  void initState() {
    titleController = TextEditingController();
    brendController = TextEditingController();
    priceController = TextEditingController();
    descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    brendController.dispose();
    priceController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cloudStorageService = Provider.of<MainController>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 270,
                  width: double.infinity,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Center(
                      child: Image(
                        image: AssetImage(AppIcons.addIcons),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  hintText: "Enter your title",
                  controller: titleController,
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: "Enter your brends",
                  controller: brendController,
                  obscureText: false,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: "Enter your price",
                  controller: priceController,
                  obscureText: false,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: "Enter your description",
                  controller: descriptionController,
                  obscureText: false,
                ),
                const SizedBox(height: 40),
                CustomElevatedButton(
                  text: "Add your Product",
                  backgroundColor: Colors.green,
                  onPressed: ()  {
                    final products = ProductModel(
                      title: titleController.text,
                      brends: brendController.text,
                      description: descriptionController.text,
                      price: priceController.text,
                    );
                    cloudStorageService.addProductStorage(products);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
