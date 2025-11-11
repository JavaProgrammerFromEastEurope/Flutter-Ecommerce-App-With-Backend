import 'package:flutter_ecommerce_2_first/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce_2_first/models/products_model.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  /// ✅ Реактивные переменные
  final RxList<dynamic> popularProductList = <dynamic>[].obs;
  final RxBool isLoaded = false.obs;
  final RxInt quantity = 0.obs;

  /// ✅ Получение списка продуктов
  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();
    if (response.statusCode == 200) {
      print("got products");
      popularProductList.clear();
      popularProductList.addAll(Product.fromJson(response.body).products);
      isLoaded.value = true;
    } else {
      isLoaded.value = false;
    }
  }

  /// ✅ Управление количеством
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
  void addItemToCart(ProductModel product) {
    if (quantity.value > 0) {
      // логика добавления в корзину
      print("Added $quantity items to cart");
      resetQuantity(); // можно сбросить после добавления
    }
  }
}
