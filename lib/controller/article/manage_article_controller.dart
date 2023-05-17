import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/model/model/article_mdel.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';
import 'package:tec/utilities/storage_const.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxBool loading = false.obs;
  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    loading.value = true;
    var response =
        await DioService().getMethod("${ApiUrlConstant.publishedByMe}1");
    // ApiUrlConstant.publishedByMe + GetStorage().read(StorageKey.userID));

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      // articleList.clear();
      loading.value = false;
    }
  }
}
