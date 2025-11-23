import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHealthAppDrawer extends StatelessWidget {
  const MyHealthAppDrawer({
    super.key,
  }); // He añadido el constructor para buenas prácticas

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.blue),
            child: const Text('My Health App'),
          ), // DrawerHeader
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              context.go('/');
            },
          ), // ListTile
          ListTile(
            title: const Text('BMI Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/bmi');
            },
          ), // ListTile
          ListTile(
            title: const Text('Age Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/age');
            },
          ), // ListTile
          ListTile(
            title: const Text('Zodiac Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/zodiac');
            },
          ), // ListTile
        ], // <Widget>[]
      ), // ListView
    ); // Drawer
  }
}
