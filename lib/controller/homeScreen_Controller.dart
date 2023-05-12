// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:tec/model/model/article_mdel.dart';
import 'package:tec/model/model/categories_model.dart';
import 'package:tec/model/model/podcasts_model.dart';
import 'package:tec/model/model/poster_model.dart';
import 'package:tec/model/model/tags_model.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModel> poster = PosterModel().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastsModel> topPodcasts = RxList();
  RxList<CategoriesModel> categoriesList = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomeItem);
    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((e) {
        topVisitedList.add(ArticleModel.fromJson(e));
      });
      response.data['top_podcasts'].forEach((e) {
        topPodcasts.add(PodcastsModel.fromJson(e));
      });
      response.data['tags'].forEach((e) {
        tagsList.add(TagsModel.fromJson(e));
      });
      poster.value = PosterModel.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
