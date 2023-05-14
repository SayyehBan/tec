// ignore_for_file: file_names

import 'package:get/get.dart';

class SingleArtcileController extends GetxController {
  RxInt id = RxInt(0);
  RxBool loading = false.obs;
  // @override
  // onInit() {
  //   super.onInit();
  // }

  // getArtcileInfo() async {
  //   loading.value = true;
  //   var response = await DioService().getMethod(ApiConstant.getArtcileList);
  //   if (response.statusCode == 200) {
  //     response.data.forEach((e) {
  //       // articleList.add(ArticleModel.fromJson(e));
  //     });
  //     loading.value = false;
  //   }
  // }
}
