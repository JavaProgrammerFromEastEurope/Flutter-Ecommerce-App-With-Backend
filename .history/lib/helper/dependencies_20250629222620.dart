import 'package:flutter_ecommerce_2_first/data/api/api_client.dart';
import 'package:flutter_ecommerce_2_first/data/repository/popular_product_repo.dart';
import 'package:get/get.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://www.dbestech.com"));

  //repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
  
}
