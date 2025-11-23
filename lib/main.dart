import 'package:app1/src/feature/screens/age_screen.dart';
import 'package:app1/src/feature/screens/bmi_screen.dart';
import 'package:app1/src/router/my_health_app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: MyHealthAppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
