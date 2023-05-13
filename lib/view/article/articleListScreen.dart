// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/article_Controller.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';
import 'package:tec/view/article/appBarList.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ArtcileController artcileController = Get.put(ArtcileController());
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: appBarList("مقالات جدید"),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: Obx(
              () => artcileController.loading.value == true
                  ? const Loading()
                  : ListView.builder(
                      itemCount: artcileController.articleList.length,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 3,
                              height: Get.height / 6,
                              child: UseCachedNetworkImage(
                                  url: artcileController
                                      .articleList[index].image!),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.size.width / 2,
                                  child: Text(
                                    artcileController.articleList[index].title!,
                                    style: themeData.textTheme.headlineMedium,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      artcileController
                                          .articleList[index].author!,
                                      style: themeData.textTheme.headlineMedium,
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '${artcileController.articleList[index].view!} بازدید',
                                      style: themeData.textTheme.headlineMedium,
                                    )
                                  ],
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
