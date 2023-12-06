import 'package:fake_store_app/models/product.dart';
import 'package:fake_store_app/screens/produt_details.dart';
import 'package:fake_store_app/services/products_service.dart';
import 'package:fake_store_app/widgets/product_item.dart';
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
    allProducts = [];
    fetchAllProducts();
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
      appBar: AppBar(
        title: const Text(
          "Fake Store",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color.fromARGB(255, 241, 205, 1),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: allProducts.length > 10 ? 10 : 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return ProductDetails(
                            title: allProducts[index].title!,
                            description: allProducts[index].description!,
                            price: allProducts[index].price!,
                            category: allProducts[index].category?.name ?? " ",
                            images: allProducts[index].images!,
                          );
                        },
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 3),
                      child: ProductTile(
                        title: allProducts[index].title ?? "",
                        categoryName: allProducts[index].category?.name ?? "",
                        imageURL: allProducts[index].images?[0],
                      ),
                    ),
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
