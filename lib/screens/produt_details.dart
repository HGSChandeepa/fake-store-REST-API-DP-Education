import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String title, description, category;
  final int price;
  final List<dynamic> images;

  const ProductDetails({
    Key? key,
    required this.title,
    required this.description,
    required this.category,
    required this.price,
    required this.images,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 5),
            Text(
              category,
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index, realIndex) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(7),
                        child: Image.network(images[index]),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 300,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    viewportFraction: 0.9,
                    aspectRatio: 2.0,
                    initialPage: 2,
                  ),
                ),
                if (images.isEmpty) CircularProgressIndicator(),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "\$" + price.toString(),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: Text(
                description,
                style: TextStyle(color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
