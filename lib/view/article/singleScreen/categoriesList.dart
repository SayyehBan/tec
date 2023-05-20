// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/article/list_article_Controller.dart';
import 'package:tec/controller/homeScreen_Controller.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/view/article/articleListScreen.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({super.key});

  var homeScreenController = Get.find<HomeScreenController>();
  ListArtcileController listArtcileController =
      Get.put(ListArtcileController());

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SizedBox(
      height: Get.height / 1.7,
      child: Obx(
        () => homeScreenController.loading.value == true
            ? const Loading()
            : GridView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: homeScreenController.tagsList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      listArtcileController.getArticleListWithTagsId(
                          homeScreenController.tagsList[index].id!);
                      Get.to(ArticleListScreen());
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Container(
                        height: 30,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            color: SolidColors.primaryColor),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                          child: Center(
                            child: Text(
                              homeScreenController.tagsList[index].title!,
                              style: themeData.textTheme.headlineSmall,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 5, mainAxisSpacing: 5),
              ),
      ),
    );
  }
}
