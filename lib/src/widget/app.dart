import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/src/controller/provider.dart';
import 'package:shopping_app/src/screen/page_builder.dart';


class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => MainController(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: PageBuilder(),
      ),
    );
  }
}
