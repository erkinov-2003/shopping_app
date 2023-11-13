import 'package:flutter/material.dart';
import 'package:shopping_app/src/common/router/app_router.dart';


class MyApplication extends StatelessWidget {
  const MyApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "pageBuilder",
      routes: AppRouter.appRouter
    );
  }
}
