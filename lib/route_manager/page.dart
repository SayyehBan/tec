import 'package:get/get.dart';
import 'package:tec/route_manager/binding.dart';
import 'package:tec/route_manager/namesRoute.dart';
import 'package:tec/view/article/manage/manage_article.dart';
import 'package:tec/view/article/singleManagment/singleManagmentScreen.dart';
import 'package:tec/view/article/singleScreen/singleScreen.dart';
import 'package:tec/view/home/homeScreen.dart';
import 'package:tec/view/podcast/single_podcast.dart';
import 'package:tec/view/splash/splashScreen.dart';

class Pages {
  Pages._();
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: NamedRoute.initialRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: NamedRoute.routeHomeScreen,
        page: () => HomeScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: NamedRoute.routeSingleScreen,
        page: () => SingleScreen(),
        binding: ArticleBinding()),
    GetPage(
        name: NamedRoute.routeManageArticles,
        page: () => ManageArticles(),
        binding: ArticleManagerBinding()),
    GetPage(
        name: NamedRoute.routeSingleManagmentArticleScreen,
        page: () => SingleManagmentArticleScreen(),
        binding: ArticleManagerBinding()),
    GetPage(
      name: NamedRoute.routeSinglePodcastScreen,
      page: () => SinglePodcastScreen(),
    ),
  ];
}
