import 'package:flutter_ecommerce_2_first/data/api/api_client.dart';
import 'package:flutter_ecommerce_2_first/models/product_model.dart';
import 'package:flutter_ecommerce_2_first/utils/app_constants.dart';

class PopularProductRepo {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<List<ProductModel>> getPopularProductList() async {
    final response = await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
    if (response.success) {
      final List<dynamic> products = response.data?['products'] ?? [];
      return products.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(
          response.errorMessage ?? "Ошибка загрузки популярных товаров");
    }
  }
}
