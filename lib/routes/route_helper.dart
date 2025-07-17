import 'package:flutter_ecommerce_2_first/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";

  // ignore: non_constant_identifier_names
  static List<GetPage> routes = [
    GetPage(name: "/", page: () => MainFoodPage(title: "")),
  ];
}
