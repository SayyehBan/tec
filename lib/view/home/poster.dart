// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/homeScreen_Controller.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';

class Poster extends StatelessWidget {
  Poster({super.key});
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return homeScreenController.loading.value == true
        ? const Loading()
        : Obx(
            () => Stack(
              children: [
                Container(
                  width: Get.size.width / 1.24,
                  height: Get.size.height / 4.2,
                  foregroundDecoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                      gradient: LinearGradient(
                          colors: GradiantColors.homePosterCoverGradiant,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: UseCachedNetworkImage(
                    url: homeScreenController.poster.value.image!,
                    containerUse: true,
                  ),
                ),
                Positioned(
                  bottom: 32,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        homeScreenController.poster.value.title!,
                        style: themeData.textTheme.displaySmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}
