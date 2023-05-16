// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:tec/controller/list_article_Controller.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/controller/single_article_Controller.dart';

class ArticleBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ListArtcileController());
    Get.lazyPut(() => SingleArtcileController());
  }
}

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
