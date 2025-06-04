import 'package:flutter/material.dart';
import 'package:news_app/Components/loading_container.dart';
import 'package:news_app/config/colors.dart';

class Newstileloading extends StatelessWidget {
  const Newstileloading({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 15),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: darkDivColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Loadingcontainer(height: 120, width: 120),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Loadingcontainer(
                                height: 20,
                                width: MediaQuery.of(context).size.width / 9),
                            const SizedBox(
                              width: 10,
                            ),
                            Loadingcontainer(
                                height: 20,
                                width: MediaQuery.of(context).size.width / 3)
                          ],
                        ),
                        const SizedBox(height: 5),
                        Loadingcontainer(
                            height: 20,
                            width: MediaQuery.of(context).size.width / 3)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}