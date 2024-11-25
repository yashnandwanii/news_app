import 'package:flutter/material.dart';
import 'package:news_app/config/colors.dart';
import 'package:news_app/pages/HomePage/Widgets/newstile.dart';
import 'package:news_app/pages/HomePage/Widgets/trendingCard.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBgColor,
      appBar: AppBar(
        backgroundColor: darkDivColor,
        title: const Text(
          'NewZiee',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Breaking News',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TrendingCard(
                      author: 'Nitesh Kumar',
                      imageUrl:
                          'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/11/24/new-project-14_1732471714.jpg',
                      tag: 'Trending no. 1',
                      time: '2',
                      title:
                          'एथर ने Eight70TM वारंटी प्रोग्राम लॉन्च किया:कंपनी के इलेक्ट्रिक स्कूटरों पर 8 साल या 80,000 किलोमीटर की वारंटी मिलेगी',
                    ),
                    TrendingCard(
                      author: 'Nitesh Kumar',
                      imageUrl:
                          'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/11/24/new-project-14_1732471714.jpg',
                      tag: 'Trending no. 1',
                      time: '2',
                      title:
                          'एथर ने Eight70TM वारंटी प्रोग्राम लॉन्च किया:कंपनी के इलेक्ट्रिक स्कूटरों पर 8 साल या 80,000 किलोमीटर की वारंटी मिलेगी',
                    ),
                    TrendingCard(
                      author: 'Nitesh Kumar',
                      imageUrl:
                          'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/11/24/new-project-14_1732471714.jpg',
                      tag: 'Trending no. 1',
                      time: '2',
                      title:
                          'एथर ने Eight70TM वारंटी प्रोग्राम लॉन्च किया:कंपनी के इलेक्ट्रिक स्कूटरों पर 8 साल या 80,000 किलोमीटर की वारंटी मिलेगी',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News for you',
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  NewsTile(
                    author: 'Nitesh Kumar',
                    imageUrl:
                        'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/11/24/new-project-14_1732471714.jpg',
                    time: '2',
                    title:
                        'एथर ने Eight70TM वारंटी प्रोग्राम लॉन्च किया:कंपनी के इलेक्ट्रिक स्कूटरों पर 8 साल या 80,000 किलोमीटर की वारंटी मिलेगी',
                  ),
                  NewsTile(
                    author: 'Nitesh Kumar',
                    imageUrl:
                        'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/11/24/new-project-14_1732471714.jpg',
                    time: '2',
                    title:
                        'एथर ने Eight70TM वारंटी प्रोग्राम लॉन्च किया:कंपनी के इलेक्ट्रिक स्कूटरों पर 8 साल या 80,000 किलोमीटर की वारंटी मिलेगी',
                  ),
                  NewsTile(
                    author: 'Nitesh Kumar',
                    imageUrl:
                        'https://images.bhaskarassets.com/webp/thumb/512x0/web2images/521/2024/11/24/new-project-14_1732471714.jpg',
                    time: '2',
                    title:
                        'एथर ने Eight70TM वारंटी प्रोग्राम लॉन्च किया:कंपनी के इलेक्ट्रिक स्कूटरों पर 8 साल या 80,000 किलोमीटर की वारंटी मिलेगी',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
