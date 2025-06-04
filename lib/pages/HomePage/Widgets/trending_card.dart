import 'package:flutter/material.dart';
import 'package:news_app/config/colors.dart';

class TrendingCard extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String time;
  final String title;
  final String author;
  final VoidCallback onTap;

  const TrendingCard({
    super.key,
    required this.author,
    required this.imageUrl,
    required this.tag,
    required this.time,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        padding: const EdgeInsets.all(10),
        width: MediaQuery.of(context).size.width *
            0.7, // Ensure fixed width for horizontal scrolling
        decoration: BoxDecoration(
          color: darkDivColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align text to the start
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: darkBgColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    tag,
                    style: const TextStyle(color: Colors.grey, fontSize: 15),
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                  ),
                ),
                Text(
                  '$time ',
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Prevent text overflow
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Text(
                    author.isNotEmpty ? author[0].toUpperCase() : '?',
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    author,
                    overflow: TextOverflow.ellipsis, // Prevent overflow
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
