// ignore_for_file: file_names

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tec/controller/podcast/single_podcast_cotroller.dart';
import 'package:tec/utilities/myColors.dart';

class MusicPlayer extends StatelessWidget {
  const MusicPlayer({
    super.key,
    required this.singlePodcastController,
  });

  final SinglePodcastController singlePodcastController;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(
        () =>
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Obx(
            () => ProgressBar(
              thumbColor: SolidColors.seeMore,
              baseBarColor: Colors.white,
              progressBarColor: SolidColors.seeMore,
              timeLabelTextStyle: themeData.textTheme.headlineSmall,
              buffered: singlePodcastController.bufferValue.value,
              progress: singlePodcastController.progressValue.value,
              total: singlePodcastController.player.duration ??
                  const Duration(seconds: 0),
              onSeek: (position) {
                singlePodcastController.player.seek(position);
                singlePodcastController.player.playing
                    ? singlePodcastController.startProgress()
                    : singlePodcastController.timer!.cancel();
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.skip_next),
                color: Colors.white,
                onPressed: () async {
                  await singlePodcastController.player.seekToNext();
                  //گرفتن شناسه اینکه کدام داره پخش میشه
                  singlePodcastController.currentFileIndex.value =
                      singlePodcastController.player.currentIndex!;
                  singlePodcastController.timerCheck();
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
                      ? singlePodcastController.timer!.cancel()
                      : singlePodcastController.startProgress();
                  //تعیین وضعیت اینکه پخش بشه یا متوقف بشه پخش
                  singlePodcastController.player.playing
                      ? singlePodcastController.player.pause()
                      : singlePodcastController.player.play();
                  singlePodcastController.startProgress();
                  //گرفتن وضعیت اینکه پخش بشه یا متوقف
                  singlePodcastController.playState.value =
                      singlePodcastController.player.playing;
                  //گرفتن شناسه اینکه کدام داره پخش میشه
                  singlePodcastController.currentFileIndex.value =
                      singlePodcastController.player.currentIndex!;
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_previous),
                color: Colors.white,
                onPressed: () async {
                  await singlePodcastController.player.seekToPrevious();
                  //گرفتن شناسه اینکه کدام داره پخش میشه
                  singlePodcastController.currentFileIndex.value =
                      singlePodcastController.player.currentIndex!;
                  singlePodcastController.timerCheck();
                },
              ),
              const SizedBox(),
              Obx(
                () => IconButton(
                  icon: const Icon(Icons.repeat),
                  color: singlePodcastController.isLoopAll.value
                      ? Colors.blue
                      : Colors.white,
                  onPressed: () {
                    singlePodcastController.setLoopMode();
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
