// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tec/controller/podcast/single_podcast_cotroller.dart';
import 'package:tec/gen/assets.gen.dart';
import 'package:tec/model/model/podcasts_model.dart';
import 'package:tec/utilities/decorations.dart';
import 'package:tec/utilities/dimens.dart';
import 'package:tec/utilities/myColors.dart';
import 'package:tec/utilities/useCachedNetworkImage.dart';
import 'package:tec/view/home/titleBlog.dart';

class SinglePodcastScreen extends StatelessWidget {
  late SinglePodcastController singlePodcastController;
  late PodcastsModel podcastsModel;
  SinglePodcastScreen({super.key}) {
    podcastsModel = Get.arguments;
    singlePodcastController =
        Get.put(SinglePodcastController(id: podcastsModel.id));
  }

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
                    SizedBox(
                      height: Get.height / 3,
                      width: double.infinity,
                      child: UseCachedNetworkImage(
                        url: podcastsModel.poster!,
                        containerUse: false,
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
                      podcastsModel.title!,
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
                        podcastsModel.author!,
                        style: themeData.textTheme.headlineMedium,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Obx(
                    () => ListView.builder(
                      itemCount: singlePodcastController.podcastFileList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await singlePodcastController.player
                                .seek(Duration.zero, index: index);
                            //گرفتن شناسه اینکه کدام داره پخش میشه
                            singlePodcastController.currentFileIndex.value =
                                singlePodcastController.player.currentIndex!;
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => TitleBlog(
                                    image: Assets.icons.microphon.path,
                                    title: singlePodcastController
                                        .podcastFileList[index].title!,
                                    right: Dimens.halfBodyMargin,
                                    color: singlePodcastController
                                                .currentFileIndex.value ==
                                            index
                                        ? SolidColors.seeMore
                                        : SolidColors.textTile,
                                  ),
                                ),
                                Text(
                                  "${singlePodcastController.podcastFileList[index].lenght!}:00",
                                  style: themeData.textTheme.headlineMedium,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        LinearPercentIndicator(
                          percent: singlePodcastController.progressValue.value,
                          backgroundColor: Colors.white,
                          progressColor: Colors.blue,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.skip_next),
                              color: Colors.white,
                              onPressed: () async {
                                await singlePodcastController.player
                                    .seekToNext();
                                //گرفتن شناسه اینکه کدام داره پخش میشه
                                singlePodcastController.currentFileIndex.value =
                                    singlePodcastController
                                        .player.currentIndex!;
                              },
                            ),
                            IconButton(
                              icon: Icon(singlePodcastController.playState.value
                                  ? Icons.pause_circle_filled
                                  : Icons.play_circle_fill),
                              color: Colors.white,
                              iconSize: 48,
                              onPressed: () {
                                //تعیین وضعیت اینکه پخش بشه یا متوقف بشه پخش
                                singlePodcastController.player.playing
                                    ? singlePodcastController.player.pause()
                                    : singlePodcastController.player.play();
                                singlePodcastController.startProgree();
                                //گرفتن وضعیت اینکه پخش بشه یا متوقف
                                singlePodcastController.playState.value =
                                    singlePodcastController.player.playing;
                                //گرفتن شناسه اینکه کدام داره پخش میشه
                                singlePodcastController.currentFileIndex.value =
                                    singlePodcastController
                                        .player.currentIndex!;
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.skip_previous),
                              color: Colors.white,
                              onPressed: () async {
                                await singlePodcastController.player
                                    .seekToPrevious();
                                //گرفتن شناسه اینکه کدام داره پخش میشه
                                singlePodcastController.currentFileIndex.value =
                                    singlePodcastController
                                        .player.currentIndex!;
                              },
                            ),
                            const SizedBox(),
                            IconButton(
                              icon: const Icon(Icons.repeat),
                              color: Colors.white,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ]),
                ),
              ),
            ))
      ]),
    ));
  }
}
