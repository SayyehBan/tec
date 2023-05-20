// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:tec/controller/article/single_article_Controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';
import 'package:tec/view/home/blogList.dart';
import 'package:tec/view/article/singleScreen/tagListArticle.dart';

class SingleScreen extends StatelessWidget {
  SingleScreen({super.key});

  SingleArtcileController singleArtcileController =
      Get.put(SingleArtcileController());

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => singleArtcileController.loading.value == true
              ? const Loading()
              : Column(
                  children: [
                    Stack(
                      children: [
                        UseCachedNetworkImage(
                          url: singleArtcileController
                              .articleInfoModel.value.image!,
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
                                    colors:
                                        GradiantColors.singleAppBarGradiant)),
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
                                  const Icon(
                                    Icons.bookmark_border_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  const Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ]),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        singleArtcileController.articleInfoModel.value.title!,
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
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArtcileController
                                .articleInfoModel.value.author!,
                            style: themeData.textTheme.headlineMedium,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            singleArtcileController
                                .articleInfoModel.value.createdAt!,
                            style: themeData.textTheme.headlineMedium,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: HtmlWidget(
                        singleArtcileController.articleInfoModel.value.content!,
                        textStyle: themeData.textTheme.headlineMedium,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) =>
                            const Loading(),
                      ),
                    ),
                    TagListArticle(),
                    const SizedBox(
                      height: 8,
                    ),
                    BlogList(),
                  ],
                ),
        ),
      )),
    );
  }
}
