import 'package:flutter_ecommerce_2_first/data/api/api_client.dart';
import 'package:flutter_ecommerce_2_first/models/product_model.dart';
import 'package:flutter_ecommerce_2_first/utils/app_constants.dart';

class RecommendedProductRepo {
  final ApiClient apiClient;
  RecommendedProductRepo({required this.apiClient});

  Future<List<ProductModel>> getRecommendedProductList() async {
    final response =
        await apiClient.getData(AppConstants.RECOMMENDED_PRODUCT_URI);
    if (response.success) {
      final List<dynamic> products = response.data?['products'] ?? [];
      return products.map((e) => ProductModel.fromJson(e)).toList();
    } else {
      throw Exception(
          response.errorMessage ?? "Ошибка загрузки рекомендованных товаров");
    }
  }
}
