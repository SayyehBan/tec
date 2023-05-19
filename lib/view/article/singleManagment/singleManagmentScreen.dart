// ignore_for_file: file_names, must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:tec/controller/article/manage_article_controller.dart';
import 'package:tec/controller/file_controller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/services/pick_file.dart';
import 'package:tec/utilities/dimens.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';
import 'package:tec/view/article/singleScreen/tagListArticle.dart';
import 'package:tec/view/home/titleBlog.dart';

class SingleManagmentArticleScreen extends StatelessWidget {
  SingleManagmentArticleScreen({super.key});

  var manageArticleController = Get.find<ManageArticleController>();
  final FilePickerController _filePickerController =
      Get.put(FilePickerController());
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
                  SizedBox(
                    width: Get.width,
                    height: Get.height / 3,
                    child: _filePickerController.file.value.name == "nothing"
                        ? UseCachedNetworkImage(
                            url: manageArticleController
                                .articleInfoModel.value.image!,
                            containerUse: false,
                          )
                        : Image.file(
                            File(_filePickerController.file.value.path!),
                            fit: BoxFit.cover,
                          ),
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
                        child: GestureDetector(
                          onTap: () {
                            pickFile();
                          },
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
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              TitleBlog(
                image: Assets.icons.bluePen.path,
                title: "ویرایش عنوان مقاله",
                right: Dimens.halfBodyMargin,
              ),
              Padding(
                padding: EdgeInsets.all(Dimens.halfBodyMargin),
                child: Text(
                  manageArticleController.articleInfoModel.value.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: themeData.textTheme.headlineMedium,
                ),
              ),
              TitleBlog(
                image: Assets.icons.bluePen.path,
                title: "ویرایش متن اصلی مقاله",
                right: Dimens.halfBodyMargin,
              ),
              Padding(
                padding: EdgeInsets.all(Dimens.halfBodyMargin),
                child: HtmlWidget(
                  manageArticleController.articleInfoModel.value.content!,
                  textStyle: themeData.textTheme.headlineMedium,
                  enableCaching: true,
                  onLoadingBuilder: (context, element, loadingProgress) =>
                      const Loading(),
                ),
              ),
              TitleBlog(
                image: Assets.icons.bluePen.path,
                title: "انتخاب دسته بندی",
                right: Dimens.halfBodyMargin,
              ),
              TagListArticle(),
            ],
          ),
        ),
      )),
    );
  }
}
