import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/controllers/popular_product_controller.dart';
import 'package:flutter_ecommerce_2_first/pages/home/main_food_page.dart';
import 'package:flutter_ecommerce_2_first/theme/app_colors.dart';
import 'package:flutter_ecommerce_2_first/utils/app_constants.dart';
import 'package:flutter_ecommerce_2_first/utils/dimensions.dart';
import 'package:flutter_ecommerce_2_first/widgets/app_column.dart';
import 'package:flutter_ecommerce_2_first/widgets/app_icon.dart';
import 'package:flutter_ecommerce_2_first/widgets/big_text.dart';
import 'package:flutter_ecommerce_2_first/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class PopularFoodDetail extends StatefulWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  State<PopularFoodDetail> createState() => _PopularFoodDetailState();
}

class _PopularFoodDetailState extends State<PopularFoodDetail> {
  late PopularProductController popularProductController;

  @override
  void initState() {
    super.initState();
    popularProductController = Get.find<PopularProductController>();

    // Сбрасываем количество после первого кадра
    WidgetsBinding.instance.addPostFrameCallback((_) {
      popularProductController.resetQuantity();
    });
  }

  @override
  Widget build(BuildContext context) {
    final product = popularProductController.popularProductList[widget.pageId];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimensions.popularFoodImgSize,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    AppConstants.BASE_URL +
                        AppConstants.UPLOAD_PRODUCT_URI +
                        product.img!,
                  ),
                ),
              ),
            ),
          ),

          // Top icons
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.width20,
            right: Dimensions.width20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => const MainFoodPage(title: ""));
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),

          // Product info
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                left: Dimensions.width20,
                right: Dimensions.width20,
                top: Dimensions.height20,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimensions.radius20),
                  topLeft: Radius.circular(Dimensions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(text: product.name!),
                  SizedBox(height: Dimensions.height20),
                  BigText(text: "Introduce"),
                  SizedBox(height: Dimensions.height10),
                  Expanded(
                    child: SingleChildScrollView(
                      child:
                          ExpandableTextWidget(text: product.description ?? ""),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom bar
      bottomNavigationBar: Obx(
        () {
          final qty = popularProductController.quantity.value;
          final totalPrice = (product.price! * qty).toStringAsFixed(2);

          return Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Quantity selector
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Dimensions.height20,
                    horizontal: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            popularProductController.setQuantity(false),
                        child: Icon(Icons.remove, color: AppColors.signColor),
                      ),
                      SizedBox(width: Dimensions.width10 / 2),
                      BigText(text: qty.toString()),
                      SizedBox(width: Dimensions.width10 / 2),
                      GestureDetector(
                        onTap: () => popularProductController.setQuantity(true),
                        child: Icon(Icons.add, color: AppColors.signColor),
                      ),
                    ],
                  ),
                ),

                // Add to Cart button
                GestureDetector(
                  onTap: qty > 0
                      ? () {
                         // popularProductController.addItem(product);
                        }
                      : null, // недоступна если quantity == 0
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimensions.height20,
                      horizontal: Dimensions.width20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color:
                          qty > 0 ? AppColors.mainColor : Colors.grey.shade400,
                    ),
                    child: BigText(
                      text: "\$ $totalPrice | Add to Cart",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
