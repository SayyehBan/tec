class TagsModel {
  String? id;
  String? title;

  TagsModel({
    required this.id,
    required this.title,
  });
  TagsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }
}
