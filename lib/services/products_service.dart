import 'dart:convert';
import 'dart:ffi';

import 'package:fake_store_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductService {
  //get all the products
  Future<List<ProductModal>> fetchAllProducts() async {
    try {
      const String url = "https://api.escuelajs.co/api/v1/products";
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final responseData = await json.decode(response.body);

        // Create the list of ProductModals
        List<ProductModal> allProducts = [];

        for (final product in responseData) {
          // Create a new ProductModal
          ProductModal newProduct = ProductModal.fromJson(product);
          // Add it to allProducts
          allProducts.add(newProduct);
        }
        debugPrint("Fetched all");

        return allProducts;
      } else {
        debugPrint("Error with the code ${response.statusCode} returned");
        // Throw an exception instead of returning null
        throw Exception("Failed to fetch products");
      }
    } catch (error) {
      debugPrint("Error: $error");
      // Throw an exception instead of returning null
      throw Exception("Failed to fetch products");
    }
  }
}
