import 'package:flutter_ecommerce_2_first/models/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get totalPrice => product.price * quantity;
}

class CartRepo {
  final Map<int, CartItem> _items = {};

  Map<int, CartItem> get items => _items;

  void addItem(ProductModel product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id!,
        (existing) => CartItem(
          product: existing.product,
          quantity: existing.quantity + quantity,
        ),
      );
    } else {
      _items[product.id!] = CartItem(product: product, quantity: quantity);
    }
  }

  void removeItem(int id) {
    _items.remove(id);
  }

  void clear() {
    _items.clear();
  }

  int get totalQuantity =>
      _items.values.fold(0, (sum, item) => sum + item.quantity);

  double get totalAmount =>
      _items.values.fold(0.0, (sum, item) => sum + item.totalPrice);
}
