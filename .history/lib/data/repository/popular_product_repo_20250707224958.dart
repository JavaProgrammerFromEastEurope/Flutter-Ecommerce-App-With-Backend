import 'package:flutter_ecommerce_2_first/data/api/api_client.dart';
import 'package:flutter_ecommerce_2_first/utils/app_constants.dart';
import 'package:get/get.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductList() async {
    //return await apiClient.getData("https://mvs.bslmeiyu.com/api/v1/products/popular");
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URL);
  }
}
