// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tec/controller/article/manage_article_controller.dart';
import 'package:tec/view/article/appBarList.dart';

class ArticleContentEditor extends StatelessWidget {
  ArticleContentEditor({super.key});
  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController = Get.find<ManageArticleController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: appBarList("نوشتن / ویرایش مقاله"),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            HtmlEditor(
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                  hint: "میتوانی در انجا مقاله ات رو بنویسی...",
                  shouldEnsureVisible: true,
                  initialText:
                      manageArticleController.articleInfoModel.value.content!),
              callbacks: Callbacks(
                onChangeContent: (p0) {
                  manageArticleController.articleInfoModel.value.content = p0;
                },
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
