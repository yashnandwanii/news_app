import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Components/navigation_bar.dart';
import 'package:news_app/Controllers/bottom_navigation_controller.dart';

class Homepagecontroller extends StatelessWidget {
  const Homepagecontroller({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavcontroller controller = Get.put(BottomNavcontroller());
    return Scaffold(
      floatingActionButton: const MyBottomNav(),
      body: Obx(
        () => controller.pages[controller.index.value],
      ),
    );
  }
}
