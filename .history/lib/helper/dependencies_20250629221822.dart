import 'package:flutter_ecommerce_2_first/data/api/api_client.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(()=>ApiClient(appBaseUrl: "https://www.dbesttech"))
}
