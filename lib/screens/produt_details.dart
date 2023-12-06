import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String title, description, category;
  final int price;
  final List<dynamic> images;

  const ProductDetails({
    super.key,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(title),
      ),
    );
  }
}
