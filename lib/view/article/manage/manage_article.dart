// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/register_controller.dart';
import 'package:tec/utilities/sizerScreen.dart';
import 'package:tec/view/article/appBarList.dart';
import 'package:tec/view/article/manage/articleEmptyState.dart';

class ManageArticles extends StatelessWidget {
  ManageArticles({super.key});
  var registerController = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    var size = SizeScreen(context).size;
    ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      appBar: appBarList("مدیریت مقتله ها"),
      body: const ArticleEmptyState(),
    ));
  }
}
