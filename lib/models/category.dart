class CategoryModel {
  //properties of category
  int? id;
  String? name;
  String? image;

  //constructor
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
  });

  CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData["id"];
    name = jsonData["name"];
    image = jsonData["image"];
  }
}
