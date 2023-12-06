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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                category,
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 300,
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Image.network(images[0]),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                " \$" + price.toString(),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  description,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ));
  }
}
