import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/pages/home/main_food_page.dart';
import 'package:flutter_ecommerce_2_first/pages/food/popular_food_detail.dart';
import 'package:flutter_ecommerce_2_first/pages/food/recommended_food_detail.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFood = "/popular-food";
  static const String recommendedFood = "/recommended-food";

  // ✅ Утилиты для генерации маршрутов с параметрами
  static String getInitial() => initial;

  static String getPopularFood(int pageId, int productId) =>
      "$popularFood?pageId=$pageId&productId=$productId";

  static String getRecommendedFood(int pageId, int productId) =>
      "$recommendedFood?pageId=$pageId&productId=$productId";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final uri = Uri.parse(settings.name ?? '');

    switch (uri.path) {
      case initial:
        return MaterialPageRoute(builder: (_) => const MainFoodPage());

      case popularFood:
        final pageId = int.tryParse(uri.queryParameters['pageId'] ?? '0') ?? 0;
        return MaterialPageRoute(
            builder: (_) => PopularFoodDetail(pageId: pageId));

      case recommendedFood:
        final pageId = int.tryParse(uri.queryParameters['pageId'] ?? '0') ?? 0;
        return MaterialPageRoute(
            builder: (_) => RecommendedFoodDetail(pageId: pageId));

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Страница не найдена')),
          ),
        );
    }
  }
}
