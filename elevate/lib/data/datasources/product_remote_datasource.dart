import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';

class ProductRemoteDataSource {
  final String apiUrl = "https://fakestoreapi.com/products";

  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((product) => ProductModel.fromJson(product)).toList();
    } else {
      throw Exception("Failed to fetch products");
    }
  }
}