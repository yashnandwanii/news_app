import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/config/colors.dart';
import 'package:news_app/pages/ArticlesPage/Widgets/search_widget.dart';
import 'package:news_app/pages/HomePage/Widgets/newstile.dart';
import 'package:news_app/pages/NewsDetails/news_details.dart';

class ArticalPage extends StatelessWidget {
  const ArticalPage({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());
    return Scaffold(
      backgroundColor: darkBgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SearchWidget(),
                const SizedBox(
                  height: 20,
                ),
                Obx(
                  () {
                    if (newsController.newsForYouList.isEmpty) {
                      return const Center(
                        child: Text(
                          'No news available',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return Column(
                      children: newsController.newsForYouList.map((e) {
                        return NewsTile(
                          imageUrl: e.urlToImage ??
                              'https://media.istockphoto.com/id/1479084992/vector/oops-we-are-sorry-something-is-not-working-here-404-error-page-404-website-error-page-not.jpg?s=1024x1024&w=is&k=20&c=S6l3xhxoEPi0WLHUjRktZLKUpQXNl4os4LCPeMLBEBg=',
                          title: e.title,
                          author: e.author,
                          time: e.publishedAt != null
                              ? e.publishedAt!.toLocal().toString()
                              : 'Unknown time',
                          ontap: () => Get.to(NewsDetails(news: e)),
                        );
                      }).toList(),
                    );
                  },
                ),

                // Add more NewsTile widgets here...
              ],
            ),
          ),
        ),
      ),
    );
  }
}
