import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tec/model/model/article_info_model.dart';
import 'package:tec/model/model/article_mdel.dart';
import 'package:tec/model/model/tags_model.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';
import 'package:tec/utilities/storage_const.dart';

class ManageArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList.empty();
  RxList<TagsModel> tagList = RxList.empty();
  RxBool loading = false.obs;
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel(
          'اینجا عنوان مقاله قرار میگیره ، یه عنوان جذاب انتخاب کن',
          '''من متن و بدنه اصلی مقاله هستم ، اگه میخوای من رو ویرایش کنی و یه مقاله جذاب بنویسی ، نوشته آبی رنگ بالا که نوشته "ویرایش متن اصلی مقاله" رو با انگشتت لمس کن تا وارد ویرایشگر بشی''',
          "")
      .obs;
  @override
  onInit() {
    super.onInit();
    getManageArticle();
  }

  getManageArticle() async {
    loading.value = true;
    var response = await DioService().getMethod(
        ApiUrlConstant.publishedByMe + GetStorage().read(StorageKey.userID));

    if (response.statusCode == 200) {
      response.data.forEach((element) {
        articleList.add(ArticleModel.fromJson(element));
      });
      // articleList.clear();
      loading.value = false;
    }
  }
}
