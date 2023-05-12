// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:tec/model/model/article_mdel.dart';
import 'package:tec/model/model/categories_model.dart';
import 'package:tec/model/model/podcasts_model.dart';
import 'package:tec/model/model/poster_model.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';
import 'package:tec/view/home/tagList.dart';

class HomeScreenController extends GetxController {
  late Rx<PosterModel> poster;
  RxList<TagList> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastsModel> topPodcasts = RxList();
  RxList<CategoriesModel> categoriesList = RxList();
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getMethod(ApiConstant.getHomeItem);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((e) {
        topVisitedList.add(ArticleModel.fromJson(e));
      });
      response.data['top_podcasts'].forEach((e) {
        topPodcasts.add(PodcastsModel.fromJson(e));
      });
    }
  }
}
