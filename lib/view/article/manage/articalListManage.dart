// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/article/manage_article_controller.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';

class ArticalListManage extends StatelessWidget {
  const ArticalListManage({
    super.key,
    required this.manageArticleController,
  });

  final ManageArticleController manageArticleController;
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return ListView.builder(
      itemCount: manageArticleController.articleList.length,
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () async {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width / 3,
                  height: Get.height / 9,
                  child: UseCachedNetworkImage(
                    url: manageArticleController.articleList[index].image!,
                    containerUse: true,
                  ),
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
                        manageArticleController.articleList[index].title!,
                        style: themeData.textTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          manageArticleController.articleList[index].author!,
                          style: themeData.textTheme.headlineMedium,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          '${manageArticleController.articleList[index].view!} بازدید',
                          style: themeData.textTheme.headlineMedium,
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
