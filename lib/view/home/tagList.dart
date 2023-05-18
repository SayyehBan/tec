// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/homeScreen_Controller.dart';
import 'package:tec/utilities/dimens.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/view/categories/mainTagList.dart';

class TagList extends StatelessWidget {
  TagList({
    super.key,
    required this.scrollDirection,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  final Axis scrollDirection;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => homeScreenController.loading.value == true
          ? const Loading()
          : SizedBox(
              height: 60,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: scrollDirection,
                itemCount: homeScreenController.tagsList.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, 8, index == 0 ? Dimens.bodyMargin : 15, 8),
                      child: MainTagList(index: index));
                },
              ),
            ),
    );
  }
}
