import 'package:flutter/material.dart';
import 'package:news_app/Components/loading_container.dart';
import 'package:news_app/config/colors.dart';

class TrendingloadingCard extends StatelessWidget {
  const TrendingloadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    const double cardWidth = 280.0; // Fixed width for consistent design
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      padding: const EdgeInsets.all(10),
      width: cardWidth,
      decoration: BoxDecoration(
        color: darkDivColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Loading image placeholder
          Loadingcontainer(
            height: 160, // Approximate height of an image
            width: cardWidth - 20, // Adjust width to account for padding
          ),
          SizedBox(height: 10),

          // Author and Time placeholders
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Loadingcontainer(
                height: 10,
                width: cardWidth / 3, // Adjust width for author text
              ),
              Loadingcontainer(
                height: 10,
                width: cardWidth / 4, // Adjust width for time text
              ),
            ],
          ),
          SizedBox(height: 10),

          // Title placeholder
          Loadingcontainer(
            height: 20,
            width: cardWidth * 0.8, // Title takes 80% of the card width
          ),
          SizedBox(height: 10),

          // Additional placeholders (e.g., tag or description)
          Row(
            children: [
              Loadingcontainer(
                height: 20,
                width: 40, // slightly smaller
              ),
              SizedBox(width: 10),
              Loadingcontainer(
                height: 20,
                width: 130,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
