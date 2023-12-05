import 'package:fake_store_app/models/category.dart';

class ProductModal {
  //properties of product
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  CategoryModel? category;

  //constructor
  ProductModal({
    required this.title,
    required this.id,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  //convert the JOSON data in to dart  readable data
  ProductModal.fromJson(Map<String, dynamic> jsonData) {
    id = jsonData["id"];
    title = jsonData["title"];
    price = jsonData["price"];
    description = jsonData['description'];
    images = jsonData["images"];
    category = jsonData["category"] != null
        ? CategoryModel.fromJson(jsonData["category"])
        : null;
  }
}
