import 'package:tec/utilities/api_constant.dart';

class ArticleModel {
  String? id;
  String? title;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  // bool? isFavorite;
  String? createdAt;

  ArticleModel({
    this.id,
    this.title,
    this.image,
    this.catId,
    this.catName,
    this.author,
    this.view,
    this.status,
    //  this.isFavorite,
    this.createdAt,
  });
  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = ApiUrlConstant.hostDlUrl + json["image"];
    catId = json["cat_id"];
    catName = json["cat_name"];
    author = json["author"];
    view = json["view"];
    status = json["status"];
    // isFavorite = json["isFavorite"];
    createdAt = json["created_at"];
  }
}
