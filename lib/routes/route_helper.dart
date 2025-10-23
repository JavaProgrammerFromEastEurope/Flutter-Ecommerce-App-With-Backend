import 'package:flutter_ecommerce_2_first/pages/food/popular_food_detail.dart';
import 'package:flutter_ecommerce_2_first/pages/food/recommended_food_detail.dart';
import 'package:flutter_ecommerce_2_first/pages/home/main_food_page.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  static String getInitial() => '$initial';
  static String getPopularFood(int pageId) => '$popularFood?pageId=$pageId';
  static String getRecommendedFood(int pageId) => '$recommendedFood?pageId=$pageId';

  // ignore: non_constant_identifier_names
  static List<GetPage> routes = [
    GetPage(name: initial, page: () => MainFoodPage(title: "")),
    GetPage(
        name: popularFood,
        page: () {
          int pageId = int.parse(Get.parameters['pageId']!);
          return PopularFoodDetail(pageId: pageId);
        },
        transition: Transition.fadeIn),
    GetPage(
        name: recommendedFood,
        page: () {
              int pageId = int.parse(Get.parameters['pageId']!);
          return RecommendedFoodDetail(pageId: pageId);
        },
        transition: Transition.fadeIn),
  ];
}
