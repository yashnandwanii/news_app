import 'package:flutter/material.dart';
import 'package:news_app/config/colors.dart';

class TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;

  const TrendingCard({
    super.key,
    required this.author,
    required this.imageUrl,
    required this.tag,
    required this.time,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      //height: 300,
      width: 280,
      decoration: BoxDecoration(
        color: darkDivColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: darkBgColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(imageUrl),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                tag,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
              Text(
                '$time days ago',
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  maxLines: 2,
                  title,
                  style: const TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                '$author',
                style: const TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ],
      ),
    );
  }
}
