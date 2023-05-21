import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/utilities/decorations.dart';
import 'package:tec/utilities/dimens.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';
import 'package:tec/view/home/titleBlog.dart';

class SinglePodcastScreen extends StatelessWidget {
  const SinglePodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Stack(
                  children: [
                    const UseCachedNetworkImage(
                      url:
                          "https://digiato.com/wp-content/uploads/2022/12/56-910x600.jpg",
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
                  padding: EdgeInsets.all(Dimens.halfBodyMargin),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "عنوان پادکست",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: themeData.textTheme.headlineMedium,
                    ),
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
                        "مهسا امینی",
                        style: themeData.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TitleBlog(
                              image: Assets.icons.microphon.path,
                              title: "بخش چهارم : فریلنسر دیوانه",
                              right: Dimens.halfBodyMargin,
                            ),
                            Text(
                              "25:00",
                              style: themeData.textTheme.headlineMedium,
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 8,
            right: Dimens.bodyMargin,
            left: Dimens.bodyMargin,
            child: Container(
              height: Get.height / Dimens.small,
              decoration: MyDecorations.mainGradiant,
            ))
      ]),
    ));
  }
}
