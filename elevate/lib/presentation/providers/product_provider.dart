import 'package:flutter/material.dart';
import '../../domin/entities/product_entity.dart';
import '../../domin/usecases/get_products_usecase.dart';

class ProductProvider extends ChangeNotifier {
  final GetProductsUseCase getProductsUseCase;

  List<ProductEntity> products = [];
  bool isLoading = false;

  ProductProvider({required this.getProductsUseCase});

  Future<void> fetchProducts() async {
    isLoading = true;
    notifyListeners();

    try {
      products = await getProductsUseCase.execute();
    } catch (e) {
      print("Error fetching products: $e");
    }

    isLoading = false;
    notifyListeners();
  }
}