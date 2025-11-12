import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/popular_product_provider.dart';
import '../../providers/recommended_product_provider.dart';
import '../../routes/route_helper.dart';
import '../../theme/app_colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  final PageController _pageController = PageController(viewportFraction: 0.85);
  double _currPageValue = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currPageValue = _pageController.page ?? 0;
      });
    });

    // ✅ Запрашиваем данные из провайдеров
    Future.microtask(() {
      final popularProv = context.read<PopularProductProvider>();
      final recommendedProv = context.read<RecommendedProductProvider>();
      if (!popularProv.isLoaded) popularProv.fetchPopularProducts();
      if (!recommendedProv.isLoaded) recommendedProv.fetchRecommendedProducts();
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);

    final popularProv = context.watch<PopularProductProvider>();
    final recommendedProv = context.watch<RecommendedProductProvider>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // 🔹 Верхняя панель
          Container(
            margin: EdgeInsets.only(
                top: Dimensions.height45, bottom: Dimensions.height15),
            padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    BigText(
                        text: "Belarus", color: AppColors.mainColor, size: 22),
                    SizedBox(height: 4),
                    SmallText(text: "Minsk", color: Colors.black54),
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(Icons.search, color: Colors.white),
                ),
              ],
            ),
          ),

          // 🔹 Основной контент
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                await popularProv.fetchPopularProducts();
                await recommendedProv.fetchRecommendedProducts();
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔸 Популярные продукты (PageView)
                    if (!popularProv.isLoaded)
                      const SizedBox(
                        height: 250,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    else if (popularProv.popularProducts.isEmpty)
                      const SizedBox(
                        height: 250,
                        child: Center(child: Text("Нет популярных блюд")),
                      )
                    else
                      SizedBox(
                        height: Dimensions.pageViewContainer,
                        child: PageView.builder(
                          controller: _pageController,
                          itemCount: popularProv.popularProducts.length,
                          itemBuilder: (context, index) {
                            final p = popularProv.popularProducts[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RouteHelper.getPopularFood(index, p.id ?? 0),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                    image: NetworkImage(p.img ?? ''),
                                    fit: BoxFit.cover,
                                    onError: (_, __) {},
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                    const SizedBox(height: 25),

                    // 🔸 Заголовок Recommended
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.width20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          BigText(text: "Recommended"),
                          SizedBox(width: 8),
                          SmallText(text: "for you", color: Colors.black54),
                        ],
                      ),
                    ),

                    const SizedBox(height: 10),

                    // 🔸 Рекомендованные продукты (ListView)
                    if (!recommendedProv.isLoaded)
                      const Center(
                          child: Padding(
                        padding: EdgeInsets.all(20),
                        child: CircularProgressIndicator(),
                      ))
                    else if (recommendedProv.recommendedProducts.isEmpty)
                      const Center(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text("Нет рекомендованных товаров"),
                        ),
                      )
                    else
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: recommendedProv.recommendedProducts.length,
                        itemBuilder: (ctx, i) {
                          final prod = recommendedProv.recommendedProducts[i];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RouteHelper.getRecommendedFood(i, prod.id ?? 0),
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: Dimensions.width20,
                                  vertical: Dimensions.height10 / 2),
                              child: Row(
                                children: [
                                  // Изображение
                                  Container(
                                    width: Dimensions.screenWidth / 3.5,
                                    height: Dimensions.screenWidth / 3.5,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        image: NetworkImage(prod.img ?? ''),
                                        fit: BoxFit.cover,
                                        onError: (_, __) {},
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Текст
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BigText(text: prod.name ?? ''),
                                        const SizedBox(height: 6),
                                        SmallText(
                                          text: prod.description ?? '',
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
