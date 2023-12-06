import 'package:flutter/material.dart';

class ProductTile extends StatelessWidget {
  final String title;
  final String categoryName;
  final dynamic imageURL;

  const ProductTile(
      {super.key,
      required this.title,
      required this.categoryName,
      required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(246, 245, 242, 242),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            padding: const EdgeInsets.all(8),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(imageURL)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(categoryName),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
