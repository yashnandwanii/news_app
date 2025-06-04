import 'package:flutter/material.dart';
import 'package:news_app/home_page_controller.dart';
import 'package:get/get.dart';

final ThemeData lightTheme = ThemeData.light();
final ThemeData darkTheme = ThemeData.dark();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      title: 'Flutter Demo',
      home: const Homepagecontroller(),
    );
  }
}
