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
  RxBool isLoopAll = false.obs;
  RxInt currentFileIndex = 0.obs;

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

  Rx<Duration> progressValue = const Duration(seconds: 0).obs;
  Rx<Duration> bufferValue = const Duration(seconds: 0).obs;
  Timer? timer;
  startProgress() {
    const tick = Duration(seconds: 1);
    int duration = player.duration!.inSeconds - player.position.inSeconds;
    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
        timer = null;
      }
    }
    if (player.duration!.inSeconds == player.position.inSeconds) {
      if (isLoopAll.value == false) {
        player.pause();
        playState.value = false;
      }
    }
    timer = Timer.periodic(tick, (timer) {
      duration--;
      progressValue.value = player.position;
      bufferValue.value = player.bufferedPosition;
      if (duration <= 0) {
        timer.cancel();
        progressValue.value = Duration.zero;
        bufferValue.value = Duration.zero;
      }
    });
  }

  setLoopMode() {
    if (isLoopAll.value == true) {
      isLoopAll.value = false;
      player.setLoopMode(LoopMode.off);
    } else {
      isLoopAll.value = true;
      player.setLoopMode(LoopMode.all);
    }
  }
}
