class CategoriesModel {
  String? id;
  String? title;

  CategoriesModel({
    required this.id,
    required this.title,
  });
  CategoriesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
  }
}
