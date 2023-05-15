// ignore: BlogList
// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/homeScreen_Controller.dart';
import 'package:tec/controller/single_article_Controller.dart';
import 'package:tec/utilities/loading.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/sizerScreen.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';

class BlogList extends StatelessWidget {
  BlogList({
    super.key,
  });
  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArtcileController singleArtcileController =
      Get.put(SingleArtcileController());
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    var size = SizeScreen(context).size;
    double bodyMargin = SizeScreen(context).bodyMargin;
    return SizedBox(
      height: size.height / 3.5,
      child: homeScreenController.loading.value == true
          ? const Loading()
          : Obx(
              () => ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: homeScreenController.topVisitedList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          singleArtcileController.getArticleInfo(
                              homeScreenController.topVisitedList[index].id);
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: index == 0 ? bodyMargin : 15,
                              left: index == 0 ? bodyMargin : 15),

                          ///BlogItem
                          child: SizedBox(
                            height: size.height / 5.3,
                            width: size.width / 2.4,
                            child: Stack(children: [
                              Container(
                                foregroundDecoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(16)),
                                    gradient: LinearGradient(
                                        colors: GradiantColors.blogPost,
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter)),
                                child: UseCachedNetworkImage(
                                  url: homeScreenController
                                      .topVisitedList[index].image!,
                                  containerUse: true,
                                ),
                              ),
                              Positioned(
                                bottom: 8,
                                left: 0,
                                right: 0,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index].author!,
                                      style: themeData.textTheme.displaySmall,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          homeScreenController
                                              .topVisitedList[index].view!,
                                          style:
                                              themeData.textTheme.displaySmall,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const Icon(
                                          CupertinoIcons.eye_fill,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ]),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                          width: size.width / 2.4,
                          child: Text(
                            homeScreenController.topVisitedList[index].title!,
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
