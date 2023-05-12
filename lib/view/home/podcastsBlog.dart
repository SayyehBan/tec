// ignore_for_file: file_names, must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tec/controller/homeScreen_Controller.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/sizerScreen.dart';

class PodcastsBlog extends StatelessWidget {
  PodcastsBlog({
    super.key,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    double bodyMargin = SizeScreen(context).bodyMargin;
    var size = SizeScreen(context).size;
    return SizedBox(
      height: SizeScreen(context).size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: homeScreenController.topPodcasts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: index == 0 ? bodyMargin : 15,
                      left: index == 0 ? bodyMargin : 15),

                  ///BlogItem
                  child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.4,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcasts[index].poster!,
                        imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover)),
                        ),
                        placeholder: (context, url) => const SpinKitFadingCube(
                          color: SolidColors.primaryColor,
                          size: 32,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 50,
                          color: Colors.grey,
                        ),
                      )),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: size.width / 2.4,
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
