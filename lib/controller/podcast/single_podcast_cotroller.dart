// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:async';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:tec/model/model/podcasts_file_model.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';

class SinglePodcastController extends GetxController {
  var id;
  SinglePodcastController({this.id});
  RxBool loading = false.obs;
  RxList<PodcastsFileModel> podcastFileList = RxList();
  final player = AudioPlayer();
  late var playList;
  RxBool playState = false.obs;
  RxInt currentFileIndex = 0.obs;
  Timer? timer;
  @override
  onInit() async {
    super.onInit();
    playList = ConcatenatingAudioSource(
      useLazyPreparation: true,
      children: [],
    );
    await getPodcastFiles();
    await player.setAudioSource(playList,
        initialIndex: 0, initialPosition: Duration.zero);
  }

  getPodcastFiles() async {
    loading.value = true;

    var response =
        await DioService().getMethod(ApiUrlConstant.podcastFiles + id);

    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        var podcastFileModel = PodcastsFileModel.fromJson(element);
        podcastFileList.add(podcastFileModel);
        playList.add(AudioSource.uri(Uri.parse(podcastFileModel.file!)));
      }
      loading.value = false;
    }
  }

  RxDouble progressValue = 0.0.obs;
  startProgree() {
    const tick = Duration(seconds: 1);
    int duration = player.duration!.inSeconds;
    var step = 1 / duration;
    timer = Timer.periodic(tick, (timer) {
      duration--;
      progressValue.value += step;
      if (duration <= 0) {
        timer.cancel();
      }
    });
  }
}
