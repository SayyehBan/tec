// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:tec/model/model/article_mdel.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';

class ListArtcileController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getArtcileList();
  }

  getArtcileList() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getArtcileList);
    if (response.statusCode == 200) {
      response.data.forEach((e) {
        articleList.add(ArticleModel.fromJson(e));
      });
      loading.value = false;
    }
  }
}
