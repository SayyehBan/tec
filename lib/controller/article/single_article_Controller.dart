// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:tec/model/model/article_info_model.dart';
import 'package:tec/model/model/article_mdel.dart';
import 'package:tec/model/model/tags_model.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';
import 'package:tec/view/article/singleScreen/singleScreen.dart';

class SingleArtcileController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> relatedList = RxList();

  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;

    loading.value = true;
    var userId = '';
    var response = await DioService().getMethod(
        '${ApiUrlConstant.baseUrl}article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(response.data);
      loading.value = false;
    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagsModel.fromJson(element));
    });

    relatedList.clear();
    response.data['related'].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
    });
    Get.to(SingleScreen());
  }
}
