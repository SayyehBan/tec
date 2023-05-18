// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:tec/controller/article/manage_article_controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/myString.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';
import 'package:tec/view/article/singleScreen/tagListArticle.dart';
import 'package:tec/view/home/titleBlog.dart';

class SingleManagmentArticleScreen extends StatelessWidget {
  SingleManagmentArticleScreen({super.key});

  var manageArticleController = Get.find<ManageArticleController>();

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Column(
            children: [
              Stack(
                children: [
                  UseCachedNetworkImage(
                    url: manageArticleController.articleInfoModel.value.image!,
                    containerUse: false,
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 60,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: GradiantColors.singleAppBarGradiant)),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.arrow_back),
                              color: Colors.white,
                              iconSize: 24,
                            ),
                            const Expanded(child: SizedBox()),
                          ]),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              color: SolidColors.primaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          height: 30,
                          width: Get.width / 3,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "انتخاب تصویر",
                                  style: themeData.textTheme.headlineSmall,
                                ),
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                )
                              ]),
                        ),
                      ))
                ],
              ),
              TitleBlog(
                image: Assets.icons.bluePen.path,
                title: MyStrings.viewHottestPosts,
                right: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  manageArticleController.articleInfoModel.value.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.headlineMedium,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Assets.images.profileAvatar.image(height: 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: HtmlWidget(
                  manageArticleController.articleInfoModel.value.content!,
                  textStyle: themeData.textTheme.headlineMedium,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      const Loading(),
                ),
              ),
              TagListArticle(),
            ],
          ),
        ),
      )),
    );
  }
}
