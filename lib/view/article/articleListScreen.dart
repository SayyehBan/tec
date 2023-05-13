// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/article_Controller.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/view/article/appBarList.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ArtcileController artcileController = Get.put(ArtcileController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Obx(
        () => artcileController.loading.value == true
            ? const Loading()
            : Column(
                children: [
                  const AppBarList(title: "مقالات جدید"),
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      itemCount: artcileController.articleList.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Text(
                            artcileController.articleList[index].title!);
                      },
                    ),
                  )
                ],
              ),
      ),
    ));
  }
}
