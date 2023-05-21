// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:tec/model/model/podcasts_file_model.dart';
import 'package:tec/services/dio_service.dart';
import 'package:tec/utilities/api_constant.dart';

class SinglePodcastController extends GetxController {
  var id;
  SinglePodcastController({this.id});
  RxBool loading = false.obs;
  RxList<PodcastsFileModel> podcastFileList = RxList();
  @override
  onInit() {
    super.onInit();
    getPodcastFiles();
  }

  getPodcastFiles() async {
    loading.value = true;

    var response =
        await DioService().getMethod(ApiUrlConstant.podcastFiles + id);

    if (response.statusCode == 200) {
      for (var element in response.data["files"]) {
        var podcastFileModel = PodcastsFileModel.fromJson(element);
        podcastFileList.add(podcastFileModel);
      }
      loading.value = false;
    }
  }
}
