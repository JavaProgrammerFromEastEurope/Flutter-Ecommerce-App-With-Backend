import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/models/product_model.dart';
import 'package:flutter_ecommerce_2_first/data/repository/cart_repo.dart';

class CartProvider extends ChangeNotifier {
  final CartRepo _repo = CartRepo();

  Map<int, CartItem> get items => _repo.items;
  int get totalQuantity => _repo.totalQuantity;
  double get totalAmount => _repo.totalAmount;

  void addItem(ProductModel product, int quantity) {
    _repo.addItem(product, quantity);
    notifyListeners();
  }

  void removeItem(int id) {
    _repo.removeItem(id);
    notifyListeners();
  }

  void clearCart() {
    _repo.clear();
    notifyListeners();
  }
}
