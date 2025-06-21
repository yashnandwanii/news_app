import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Components/news_tile_loading.dart';
import 'package:news_app/Components/trending_loading.dart';
import 'package:news_app/Controllers/news_controller.dart';
import 'package:news_app/config/colors.dart';
import 'package:news_app/config/constants.dart';
import 'package:news_app/pages/HomePage/Widgets/newstile.dart';
import 'package:news_app/pages/HomePage/Widgets/trending_card.dart';
import 'package:news_app/pages/NewsDetails/news_details.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  String formatDate(DateTime? dt) {
    return dt != null
        ? DateFormat('hh:mm a • dd MMM yyyy').format(dt.toLocal())
        : 'Unknown';
  }

  Widget _drawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        // Handle drawer item tap
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final NewsController newsController = Get.put(NewsController());
    newsController.getTrendingNews();
    newsController.getNewsForYou();
    newsController.getAppleNewsForYou();
    newsController.getWallStreetNewsForYou();
    newsController.getBusinessForYou();

    return Scaffold(
      drawer: Drawer(
        backgroundColor: const Color(0xFF191B28),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        AssetImage("assets/images/user_avatar.jpg"),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Welcome, Yash Nandwani",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            _drawerItem(Icons.article, 'Top News'),
            _drawerItem(Icons.category, 'Categories'),
            _drawerItem(Icons.settings, 'Settings'),
            _drawerItem(Icons.favorite, 'Preferences'),
            _drawerItem(Icons.info, 'About'),
            _drawerItem(Icons.logout, 'Logout'),
          ],
        ),
      ),
      backgroundColor: darkBgColor,
      appBar: AppBar(
        backgroundColor: darkDivColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'NewZiee',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            GestureDetector(
              onTap: newsController.getNewsForYou,
              child: const Icon(Icons.person, size: 30, color: Colors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildSectionHeader('Breaking News', 'See all'),
              const SizedBox(height: 20),
              Obx(
                () {
                  if (newsController.trendingNewsList.isEmpty) {
                    return const Center(
                      child: Text(
                        'No trending news available.',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    );
                  }

                  return newsController.isTrendingNewsLoading.value
                      ? const Row(
                          children: [
                            Expanded(child: TrendingloadingCard()),
                            Expanded(child: TrendingloadingCard()),
                          ],
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: newsController.trendingNewsList.map(
                                (e) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: SizedBox(
                                      width: 280,
                                      child: TrendingCard(
                                        onTap: () =>
                                            Get.to(NewsDetails(news: e)),
                                        author: e.author ?? 'Unknown',
                                        imageUrl: e.urlToImage ?? '...',
                                        tag: 'Trending',
                                        time: formatDate(e.publishedAt),
                                        title: e.title ?? 'No title available',
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                            ),
                          ),
                        );
                },
              ),
              const SizedBox(height: 20),
              _buildSectionHeader('News for you', 'See all'),
              const SizedBox(height: 20),
              Obx(() {
                return newsController.isNewsForYouLoading.value
                    ? const Column(
                        children: [
                          Newstileloading(),
                          Newstileloading(),
                          Newstileloading(),
                          Newstileloading(),
                        ],
                      )
                    : Column(
                        children: newsController.newsForYouList10.map((e) {
                          return NewsTile(
                            ontap: () => Get.to(NewsDetails(news: e)),
                            author: e.author ?? 'Unknown',
                            imageUrl: e.urlToImage ?? imageUrl,
                            time: formatDate(e.publishedAt),
                            title: e.title ?? 'No title available',
                          );
                        }).toList(),
                      );
              }),
              _buildSectionHeader('Apple News', 'See More'),
              const SizedBox(height: 20),
              Obx(
                () {
                  return newsController.isAppleNewsLoading.value
                      ? const Column(
                          children: [
                            Newstileloading(),
                            Newstileloading(),
                            Newstileloading(),
                            Newstileloading(),
                          ],
                        )
                      : Column(
                          children: newsController.appleNews5.map(
                            (e) {
                              return NewsTile(
                                ontap: () => Get.to(NewsDetails(news: e)),
                                author: e.author ?? 'Unknown',
                                imageUrl: e.urlToImage ?? imageUrl,
                                time: formatDate(e.publishedAt),
                                title: e.title ?? 'No title available',
                              );
                            },
                          ).toList(),
                        );
                },
              ),
              const SizedBox(height: 20),
              _buildSectionHeader('Tesla News', 'See More'),
              const SizedBox(height: 10),
              Obx(() {
                if (newsController.teslaNewsList.isEmpty) {
                  return const Center(
                    child: Text(
                      'No trending news available.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return newsController.isTeslaNewsLoading.value
                    ? const Column(
                        children: [
                          Newstileloading(),
                          Newstileloading(),
                          Newstileloading(),
                          Newstileloading(),
                        ],
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: newsController.teslaNews5.map((e) {
                            return TrendingCard(
                              onTap: () => Get.to(NewsDetails(news: e)),
                              author: e.author ?? 'Unknown',
                              imageUrl: e.urlToImage ?? imageUrl,
                              tag: 'Trending',
                              time: formatDate(e.publishedAt),
                              title: e.title ?? 'No title available',
                            );
                          }).toList(),
                        ),
                      );
              }),
              const SizedBox(height: 10),
              _buildSectionHeader('WallStreet News', 'See More'),
              const SizedBox(height: 10),
              Obx(() {
                if (newsController.wallStreetNews5.isEmpty) {
                  return const Center(
                    child: Text(
                      'No trending news available.',
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  );
                }

                return newsController.isWallStreetNewsLoading.value
                    ? const CircularProgressIndicator()
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: newsController.wallStreetNews5.map((e) {
                            return TrendingCard(
                              onTap: () => Get.to(NewsDetails(news: e)),
                              author: e.author ?? 'Unknown',
                              imageUrl: e.urlToImage ?? imageUrl,
                              tag: 'Trending',
                              time: formatDate(e.publishedAt),
                              title: e.title ?? 'No title available',
                            );
                          }).toList(),
                        ),
                      );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(color: Colors.white, fontSize: 22)),
        Text(actionText,
            style: const TextStyle(color: Colors.grey, fontSize: 14)),
      ],
    );
  }
}
