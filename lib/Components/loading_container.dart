import 'package:flutter/material.dart';
import 'package:news_app/config/colors.dart';
import 'package:shimmer/shimmer.dart';

class Loadingcontainer extends StatelessWidget {
  final double height;
  final double width;
  const Loadingcontainer(
      {super.key, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: darkBgColor,
      highlightColor: darkDivColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
