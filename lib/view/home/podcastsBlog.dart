// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/homeScreen_Controller.dart';
import 'package:tec/route_manager/namesRoute.dart';
import 'package:tec/utilities/dimens.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';

class PodcastsBlog extends StatelessWidget {
  PodcastsBlog({
    super.key,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);

    return SizedBox(
      height: Get.height / 3.5,
      child: homeScreenController.loading.value == true
          ? const Loading()
          : Obx(
              () => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeScreenController.topPodcasts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(NamedRoute.routeSinglePodcastScreen,
                              arguments:
                                  homeScreenController.topPodcasts[index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: index == 0 ? Dimens.bodyMargin : 15,
                              left: index == 0 ? Dimens.bodyMargin : 15),

                          ///BlogItem
                          child: SizedBox(
                              height: Get.size.height / 5.3,
                              width: Get.size.width / 2.4,
                              child: UseCachedNetworkImage(
                                url: homeScreenController
                                    .topPodcasts[index].poster!,
                                containerUse: true,
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                          width: Get.size.width / 2.4,
                          child: Text(
                            homeScreenController.topPodcasts[index].title!,
                            style: themeData.textTheme.headlineMedium,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ))
                    ],
                  );
                },
              ),
            ),
    );
  }
}
