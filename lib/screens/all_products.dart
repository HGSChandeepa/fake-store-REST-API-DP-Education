import 'package:fake_store_app/models/product.dart';
import 'package:fake_store_app/services/products_service.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatefulWidget {
  const AllProducts({Key? key}) : super(key: key);

  @override
  _AllProductsState createState() => _AllProductsState();
}

class _AllProductsState extends State<AllProducts> {
  final ProductService _productService = ProductService();
  late List<ProductModal> allProducts = [];

  @override
  void initState() {
    super.initState();
  }

  // Fetch all products
  Future<void> fetchAllProducts() async {
    List<ProductModal> products = await _productService.fetchAllProducts();
    setState(() {
      allProducts = products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextButton(
              child: const Text("Click"),
              onPressed: () async {
                await fetchAllProducts(); // Await the fetchAllProducts call
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: allProducts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(allProducts[index].images?[0] ?? ""),
                    leading: Image.network(
                        "https://spicyip.com/wp-content/uploads/2021/07/word-design.jpg"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
