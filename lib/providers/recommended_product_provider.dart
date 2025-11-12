import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/data/repository/recommended_product_repo.dart';
import 'package:flutter_ecommerce_2_first/models/product_model.dart';

class RecommendedProductProvider with ChangeNotifier {
  final RecommendedProductRepo repo;

  RecommendedProductProvider({required this.repo});

  List<ProductModel> _recommendedProducts = [];
  bool _isLoaded = false;

  List<ProductModel> get recommendedProducts => _recommendedProducts;
  bool get isLoaded => _isLoaded;

  Future<void> fetchRecommendedProducts() async {
    try {
      final products = await repo.getRecommendedProductList();
      _recommendedProducts = products;
      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint("Ошибка загрузки рекомендованных товаров: $e");
      _isLoaded = false;
    }
  }
}
