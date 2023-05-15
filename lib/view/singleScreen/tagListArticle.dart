// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/list_article_Controller.dart';
import 'package:tec/controller/single_article_Controller.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/view/article/articleListScreen.dart';

class TagListArticle extends StatelessWidget {
  TagListArticle({super.key});

  SingleArtcileController singleArtcileController =
      Get.put(SingleArtcileController());
  ListArtcileController listArtcileController =
      Get.put(ListArtcileController());

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SizedBox(
      height: 35,
      child: Obx(
        () => singleArtcileController.loading.value == true
            ? const Loading()
            : ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: singleArtcileController.tagList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      listArtcileController.getArticleListWithTagsId(
                          singleArtcileController.tagList[index].id!);
                      Get.to(ArticleListScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: Colors.grey),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Text(
                            singleArtcileController.tagList[index].title!,
                            style: themeData.textTheme.headlineMedium,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
