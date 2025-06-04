import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/Model/news_model.dart';
import 'package:news_app/config/colors.dart';

class NewsDetails extends StatelessWidget {
  final NewsModel news;

  const NewsDetails({super.key, required this.news});

  String formatDate(DateTime? dt) {
    return dt != null
        ? DateFormat('hh:mm a • dd MMM yyyy').format(dt.toLocal())
        : 'Unknown';
  }

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: darkDivColor,
        title: const Text(
          'News Details',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Get.back(),
        ),
      ),
      backgroundColor: darkBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 330,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      news.urlToImage ?? 'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  news.title ?? "No Title",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  formatDate(news.publishedAt),
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.red,
                      child: Text(
                        (news.author?.isNotEmpty == true)
                            ? news.author![0]
                            : '?',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      news.author ?? "Unknown Author",
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.bookmark, color: Colors.white),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Obx(() {
                    return Row(
                      children: [
                        SizedBox(
                          width: 40,
                          child: IconButton(
                            onPressed: () {
                              if (newsController.isSpeaking.value) {
                                newsController.stop();
                              } else {
                                newsController.speak(
                                  news.description ??
                                      "No description available.",
                                );
                              }
                            },
                            tooltip: newsController.isSpeaking.value
                                ? 'Stop'
                                : 'Play',
                            icon: Icon(
                              newsController.isSpeaking.value
                                  ? Icons.stop
                                  : Icons.play_arrow,
                              size: 30,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Lottie.asset(
                            'assets/animations/Animation.json',
                            height: 70,
                            fit: BoxFit.contain,
                            animate: newsController.isSpeaking.value,
                          ),
                        ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 20),
                Text(
                  news.description ?? "No description available.",
                  style: const TextStyle(color: Colors.grey, fontSize: 18),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
