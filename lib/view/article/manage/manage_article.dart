// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/article/manage_article_controller.dart';
import 'package:tec/main.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/view/article/appBarList.dart';
import 'package:tec/view/article/manage/articalListManage.dart';
import 'package:tec/view/article/manage/articleEmptyState.dart';

class ManageArticles extends StatelessWidget {
  ManageArticles({super.key});
  var manageArticleController = Get.find<ManageArticleController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBarList("مدیریت مقاله ها"),
      body: Obx(() => manageArticleController.loading.value
          ? const Loading()
          : manageArticleController.articleList.isNotEmpty
              ? ArticalListManage(
                  manageArticleController: manageArticleController)
              : const ArticleEmptyState()),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(Size(Get.width / 3, 56))),
          onPressed: () {
            Get.toNamed(NamedRoute.routeSingleManagmentArticleScreen);
          },
          child: const Text(
            'بریم برای نوشتن یه مقاله باحال',
          ),
        ),
      ),
    ));
  }
}
