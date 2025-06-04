import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/Model/news_model.dart';

class NewsController extends GetxController {
  RxList<NewsModel> trendingNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList10 = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNews5 = <NewsModel>[].obs;
  RxList<NewsModel> businessNewsList = <NewsModel>[].obs;
  RxList<NewsModel> businessNews5 = <NewsModel>[].obs;
  RxList<NewsModel> teslaNewsList = <NewsModel>[].obs;
  RxList<NewsModel> teslaNews5 = <NewsModel>[].obs;
  RxList<NewsModel> wallStreetNewsList = <NewsModel>[].obs;
  RxList<NewsModel> wallStreetNews5 = <NewsModel>[].obs;
  FlutterTts flutterTts = FlutterTts();

  RxBool isSpeaking = false.obs;

  RxBool isTrendingNewsLoading = false.obs;
  RxBool isAppleNewsLoading = false.obs;
  RxBool isBusinessNewsLoading = false.obs;
  RxBool isWallStreetNewsLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isTeslaNewsLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getNewsForYou();
    getTrendingNews();
    getAppleNewsForYou();
    getBusinessForYou();
    getTeslaForYou();
    getWallStreetNewsForYou();
  }

  Future<void> getTrendingNews() async {
    isTrendingNewsLoading.value = true;
    try {
      const String baseUrl =
          'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=a4f300e821c84379a684f2e30aad24ad';
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body['articles'] as List?;

        if (articles != null) {
          trendingNewsList.assignAll(
            articles.map((e) => NewsModel.fromJson(e)).toList(),
          );
        } else {
          debugPrint('No articles found');
        }
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isTrendingNewsLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    try {
      const String baseUrl =
          'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=a4f300e821c84379a684f2e30aad24ad';
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body['articles'] as List?;

        if (articles != null) {
          newsForYouList.assignAll(
            articles.map((e) => NewsModel.fromJson(e)).toList(),
          );

          // Safely slice the list
          int end = newsForYouList.length < 5 ? newsForYouList.length : 5;
          newsForYouList10.assignAll(newsForYouList.sublist(0, end));
        } else {
          debugPrint('No articles found');
        }
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getTeslaForYou() async {
    isTeslaNewsLoading.value = true;
    try {
      const String baseUrl =
          ('https://newsapi.org/v2/everything?q=tesla&from=2025-05-04&sortBy=publishedAt&apiKey=a4f300e821c84379a684f2e30aad24ad');
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body['articles'] as List?;

        if (articles != null) {
          teslaNewsList.assignAll(
            articles.map((e) => NewsModel.fromJson(e)).toList(),
          );
          int end = teslaNewsList.length < 5 ? teslaNewsList.length : 5;
          teslaNews5.assignAll(teslaNewsList.sublist(0, end));
        } else {
          debugPrint('No articles found');
        }
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isTeslaNewsLoading.value = false;
  }

  Future<void> getBusinessForYou() async {
    isBusinessNewsLoading.value = true;
    try {
      const String baseUrl =
          ('https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=a4f300e821c84379a684f2e30aad24ad');
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body['articles'] as List?;

        if (articles != null) {
          businessNewsList.assignAll(
            articles.map((e) => NewsModel.fromJson(e)).toList(),
          );
          int end = businessNewsList.length < 5 ? businessNewsList.length : 5;
          businessNews5.assignAll(businessNewsList.sublist(0, end));
        } else {
          debugPrint('No articles found');
        }
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isBusinessNewsLoading.value = false;
  }

  Future<void> getAppleNewsForYou() async {
    isAppleNewsLoading.value = true;
    try {
      const String baseUrl =
          ('https://newsapi.org/v2/everything?q=apple&from=2025-06-03&to=2025-06-03&sortBy=popularity&apiKey=a4f300e821c84379a684f2e30aad24ad');
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body['articles'] as List?;

        if (articles != null) {
          appleNewsList.assignAll(
            articles.map((e) => NewsModel.fromJson(e)).toList(),
          );
          int end = appleNewsList.length < 5 ? appleNewsList.length : 5;
          appleNews5.assignAll(appleNewsList.sublist(0, end));
        } else {
          debugPrint('No articles found');
        }
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isAppleNewsLoading.value = false;
  }

  Future<void> getWallStreetNewsForYou() async {
    isWallStreetNewsLoading.value = true;
    try {
      const String baseUrl =
          ('https://newsapi.org/v2/everything?domains=wsj.com&apiKey=a4f300e821c84379a684f2e30aad24ad');
      final response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body['articles'] as List?;

        if (articles != null) {
          wallStreetNewsList.assignAll(
            articles.map((e) => NewsModel.fromJson(e)).toList(),
          );
          int end =
              wallStreetNewsList.length < 5 ? wallStreetNewsList.length : 5;
          wallStreetNews5.assignAll(wallStreetNewsList.sublist(0, end));
        } else {
          debugPrint('No articles found');
        }
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isWallStreetNewsLoading.value = false;
  }

  Future<void> searchNews(String search) async {
    isNewsForYouLoading.value = false;

    var baseUrl =
        'https://newsapi.org/v2/everything?q=$search&apiKey=a4f300e821c84379a684f2e30aad24ad';
    try {
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        final articles = body['articles'] as List?;
        newsForYouList.clear();

        if (articles != null) {
          newsForYouList.assignAll(
            articles.map((e) => NewsModel.fromJson(e)).toList(),
          );
        } else {
          debugPrint('No articles found');
        }
      } else {
        debugPrint('Failed to fetch data: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> speak(String text) async {
    await flutterTts.stop(); // Ensure no overlapping speech
    isSpeaking.value = true;

    await flutterTts.setLanguage('en-US');
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.4);

    // Set completion callback to reset the state when done
    flutterTts.setCompletionHandler(() {
      isSpeaking.value = false;
    });

    flutterTts.setCancelHandler(() {
      isSpeaking.value = false;
    });

    flutterTts.setErrorHandler((msg) {
      isSpeaking.value = false;
    });

    await flutterTts.speak(text);
  }

  Future<void> stop() async {
    await flutterTts.stop();
    isSpeaking.value = false;
  }
}
