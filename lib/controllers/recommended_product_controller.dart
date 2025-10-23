import 'package:flutter_ecommerce_2_first/data/repository/recommended_product_repo.dart';
import 'package:flutter_ecommerce_2_first/models/products_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class RecommendedProductController extends GetxController {
  final RecommendedProductRepo recommendedProductRepo;
  RecommendedProductController({required this.recommendedProductRepo});

  final RxList<dynamic> recommendedProductList = <dynamic>[].obs;
  final RxBool isLoaded = false.obs;
  final RxInt quantity = 0.obs;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo.getRecommendedProductList();
    if (response.statusCode == 200) {
      print("Got recommended products");
      recommendedProductList.clear();
      recommendedProductList.addAll(Product.fromJson(response.body).products);
      isLoaded.value = true;
    } else {
      isLoaded.value = false;
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      quantity.value++;
    } else {
      if (quantity.value > 0) {
        quantity.value--;
      }
    }
  }

  void resetQuantity() {
    quantity.value = 0;
  }

  // метод добавления в корзину (если есть)
  void addItemToCart() {
    if (quantity.value > 0) {
      // логика добавления в корзину
      print("Added $quantity items to cart");
      resetQuantity(); // можно сбросить после добавления
    }
  }
}
