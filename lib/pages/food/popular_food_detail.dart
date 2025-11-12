import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';
import '../../providers/popular_product_provider.dart';
import '../../theme/app_colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text_widget.dart';

class PopularFoodDetail extends StatefulWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    Dimensions.init(context);
    final popularProv = context.watch<PopularProductProvider>();
    final cart = context.watch<CartProvider>();

    if (!popularProv.isLoaded) {
      popularProv.fetchPopularProducts();
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final product = popularProv.popularProducts[widget.pageId];

    return Scaffold(
      body: Stack(
        children: [
          // Фото
          Image.network(
            product.img ?? '',
            height: Dimensions.popularFoodImgSize,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: Colors.grey[300]),
          ),

          // Верхние кнопки
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const AppIcon(icon: Icons.arrow_back_ios)),
                AppIcon(
                    icon: Icons.shopping_cart_outlined,
                    itemCount: cart.totalQuantity),
              ],
            ),
          ),

          // Контент
          Positioned(
            top: Dimensions.popularFoodImgSize - 30,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: EdgeInsets.all(Dimensions.width20),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: product.name ?? ''),
                  SizedBox(height: Dimensions.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandableTextWidget(
                        text: product.description ?? '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Нижняя панель
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Dimensions.width20,
          vertical: Dimensions.height20,
        ),
        color: AppColors.buttonBackgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Количество
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    if (quantity > 1) setState(() => quantity--);
                  },
                  icon: const Icon(Icons.remove),
                ),
                BigText(text: quantity.toString()),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            // Добавить в корзину
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
              ),
              onPressed: () {
                cart.addItem(product, quantity);
              },
              child: BigText(
                text:
                    "\$${(product.price * quantity).toStringAsFixed(2)} | Add to cart",
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
