import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/controllers/recommended_product_controller.dart';
import 'package:flutter_ecommerce_2_first/routes/route_helper.dart';
import 'package:flutter_ecommerce_2_first/theme/app_colors.dart';
import 'package:flutter_ecommerce_2_first/utils/app_constants.dart';
import 'package:flutter_ecommerce_2_first/utils/dimensions.dart';
import 'package:flutter_ecommerce_2_first/widgets/app_icon.dart';
import 'package:flutter_ecommerce_2_first/widgets/big_text.dart';
import 'package:flutter_ecommerce_2_first/widgets/expandable_text_widget.dart';
import 'package:get/get.dart';

class RecommendedFoodDetail extends StatefulWidget {
  final int pageId;
  const RecommendedFoodDetail({super.key, required this.pageId});

  @override
  State<RecommendedFoodDetail> createState() => _RecommendedFoodDetailState();
}

class _RecommendedFoodDetailState extends State<RecommendedFoodDetail> {
  late RecommendedProductController recommendedProduct;
  late var product;

  @override
  void initState() {
    super.initState();
    recommendedProduct = Get.find<RecommendedProductController>();
    product = recommendedProduct.recommendedProductList[widget.pageId];

    // Сбрасываем quantity после первого кадра
    WidgetsBinding.instance.addPostFrameCallback((_) {
      recommendedProduct.resetQuantity();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 90,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Get.toNamed(RouteHelper.getInitial()),
                  child: AppIcon(icon: Icons.clear),
                ),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20),
                    topRight: Radius.circular(Dimensions.radius20),
                  ),
                ),
                child: Center(
                  child: BigText(
                    size: Dimensions.font26,
                    text: product.name!,
                  ),
                ),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL +
                    AppConstants.UPLOAD_PRODUCT_URI +
                    product.img!,
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
              child: ExpandableTextWidget(text: product.description!),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() {
        bool isAddEnabled = recommendedProduct.quantity.value > 0;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20 * 2.5,
                vertical: Dimensions.height10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => recommendedProduct.setQuantity(false),
                    child: AppIcon(
                      iconSize: Dimensions.iconSize24,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.remove,
                    ),
                  ),
                  BigText(
                    text:
                        "\$ ${product.price!}  X  ${recommendedProduct.quantity.value}",
                    color: AppColors.mainBlackColor,
                    size: Dimensions.font16,
                  ),
                  GestureDetector(
                    onTap: () => recommendedProduct.setQuantity(true),
                    child: AppIcon(
                      iconSize: Dimensions.iconSize24,
                      iconColor: Colors.white,
                      backgroundColor: AppColors.mainColor,
                      icon: Icons.add,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: Dimensions.bottomHeightBar,
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
                vertical: Dimensions.height30,
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
                  Container(
                    padding: EdgeInsets.all(Dimensions.width20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white,
                    ),
                    child: const Icon(
                      Icons.favorite,
                      color: AppColors.mainColor,
                    ),
                  ),
                  // Add to cart кнопка
                  GestureDetector(
                    onTap: isAddEnabled
                        ? () {
                            // TODO: Добавить в корзину
                          }
                        : null,
                    child: Container(
                      padding: EdgeInsets.all(Dimensions.width20),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: isAddEnabled
                            ? AppColors.mainColor
                            : Colors.grey.shade400,
                      ),
                      child: BigText(
                        text:
                            "\$ ${(product.price! * recommendedProduct.quantity.value).toStringAsFixed(2)} | Add to cart",
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
