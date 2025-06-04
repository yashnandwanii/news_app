import 'package:get/get.dart';
import 'package:news_app/pages/ArticlesPage/artical_page.dart';
import 'package:news_app/pages/HomePage/homepage.dart';
import 'package:news_app/pages/Profile/profilepage.dart';

class BottomNavcontroller extends GetxController {
  RxInt index = 0.obs;

  var pages = [
    const Homepage(),
    const ArticalPage(),
    const Profilepage(),
  ];
}
