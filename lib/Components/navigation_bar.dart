import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/bottom_navigation_controller.dart';
import 'package:news_app/config/colors.dart';

class MyBottomNav extends StatelessWidget {
  const MyBottomNav({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BottomNavcontroller controller = Get.put(BottomNavcontroller());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 60,
          width: 200,
          decoration: BoxDecoration(
            color: darkDivColor,
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  controller.index.value = 0;
                },
                child: Obx(
                  () => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.bounceOut,
                      height: 50,
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: controller.index.value == 0
                              ? Theme.of(context).colorScheme.primaryContainer
                              : null,
                          borderRadius: BorderRadius.circular(100)),
                      child: Icon(
                        Icons.home,
                        size: 25,
                        color: controller.index.value == 0
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.secondaryContainer,
                      )),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.index.value = 1;
                },
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 50,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: controller.index.value == 1
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.book,
                      size: 25,
                      color: controller.index.value == 1
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  controller.index.value = 2;
                },
                child: Obx(
                  () => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: 50,
                    width: 40,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: controller.index.value == 2
                            ? Theme.of(context).colorScheme.primaryContainer
                            : null,
                        borderRadius: BorderRadius.circular(100)),
                    child: Icon(
                      Icons.settings,
                      size: 25,
                      color: controller.index.value == 2
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.secondaryContainer,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
