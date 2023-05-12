import 'package:tec/utilities/api_constant.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });
  PosterModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = ApiConstant.hostUrl + json["image"];
  }
}
