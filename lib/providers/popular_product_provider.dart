import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce_2_first/models/product_model.dart';

class PopularProductProvider with ChangeNotifier {
  final PopularProductRepo repo;

  PopularProductProvider({required this.repo});

  List<ProductModel> _popularProducts = [];
  bool _isLoaded = false;

  List<ProductModel> get popularProducts => _popularProducts;
  bool get isLoaded => _isLoaded;

  Future<void> fetchPopularProducts() async {
    try {
      final products = await repo.getPopularProductList();
      _popularProducts = products;
      _isLoaded = true;
      notifyListeners();
    } catch (e) {
      debugPrint("Ошибка загрузки популярных товаров: $e");
      _isLoaded = false;
    }
  }
}
