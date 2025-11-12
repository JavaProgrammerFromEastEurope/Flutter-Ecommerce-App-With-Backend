import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ecommerce_2_first/data/api/api_client.dart';
import 'package:flutter_ecommerce_2_first/data/repository/cart_repo.dart';
import 'package:flutter_ecommerce_2_first/data/repository/popular_product_repo.dart';
import 'package:flutter_ecommerce_2_first/data/repository/recommended_product_repo.dart';
import 'package:flutter_ecommerce_2_first/providers/cart_provider.dart';
import 'package:flutter_ecommerce_2_first/providers/popular_product_provider.dart';
import 'package:flutter_ecommerce_2_first/providers/recommended_product_provider.dart';
import 'package:flutter_ecommerce_2_first/routes/route_helper.dart';
import 'package:flutter_ecommerce_2_first/utils/app_constants.dart';

void main() {
  final apiClient = ApiClient(
    baseUrl: AppConstants.BASE_URL,
    token: AppConstants.TOKEN,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(
            create: (_) => PopularProductProvider(
                repo: PopularProductRepo(apiClient: apiClient))),
        ChangeNotifierProvider(
            create: (_) => RecommendedProductProvider(
                repo: RecommendedProductRepo(apiClient: apiClient))),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      initialRoute: RouteHelper.initial,
      onGenerateRoute: RouteHelper.generateRoute,
    );
  }
}
