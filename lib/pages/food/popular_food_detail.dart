import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/theme/app_colors.dart';
import 'package:flutter_ecommerce_2_first/utils/dimensions.dart';
import 'package:flutter_ecommerce_2_first/widgets/app_column.dart';
import 'package:flutter_ecommerce_2_first/widgets/app_icon.dart';
import 'package:flutter_ecommerce_2_first/widgets/big_text.dart';
import 'package:flutter_ecommerce_2_first/widgets/expandable_text_widget.dart';
import 'package:flutter_ecommerce_2_first/widgets/icon_and_text_widget.dart';
import 'package:flutter_ecommerce_2_first/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // background image
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                  width: double.maxFinite,
                  height: Dimensions.popularFoodImgSize,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          "assets/img/food0.png",
                        )),
                  ))),
          // icon widget
          Positioned(
              top: Dimensions.height45,
              left: Dimensions.width20,
              right: Dimensions.width20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppIcon(icon: Icons.arrow_back_ios),
                  AppIcon(icon: Icons.shopping_cart_outlined),
                ],
              )),
          // introduction of food
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: Dimensions.popularFoodImgSize - 20,
              child: Container(
                  padding: EdgeInsets.only(
                      left: Dimensions.width20,
                      right: Dimensions.width20,
                      top: Dimensions.height20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(Dimensions.radius20),
                        topLeft: Radius.circular(Dimensions.radius20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppColumn(
                        text: "Chinese Side",
                      ),
                      SizedBox(
                        height: Dimensions.height20,
                      ),
                      BigText(text: "Introduce"),
                      SizedBox(height: Dimensions.height20 / 2),
                      Expanded(
                          child: SingleChildScrollView(
                              child: ExpandableTextWidget(
                                  text:
                                      "Ad officia laboris Lorem adipisicing sit veniam. Tempor labore nisi ut ea nostrud quis. Ea dolor labore magna aute anim eiusmod adipisicing esse aliquip fugiat quis labore. Voluptate excepteur eu minim ipsum quis velit Lorem ex labore officia ex ex. Cillum proident id excepteur laborum. Voluptate adipisicing do aute nulla labore qui elit incididunt esse do incididunt aliqua sint. Quis aliqua aliquip aute incididunt fugiat laboris est labore. In occaecat ipsum mollit et ipsum consequat veniam. Nostrud deserunt duis elit ex sint incididunt anim consectetur sint nulla. Fugiat magna aliqua ea cupidatat ex sint et non consequat et in. Non mollit officia dolore labore occaecat adipisicing dolore eu eu exercitation ad nostrud aute. Eu cupidatat aliqua veniam consectetur laboris. Deserunt exercitation officia labore aliquip duis amet voluptate quis velit incididunt dolor aliqua Lorem. Elit aliquip irure minim irure et aute in veniam dolore Lorem Lorem. Commodo exercitation sit dolor fugiat voluptate aute mollit eiusmod aliquip nulla velit eu. Ea ea velit occaecat aute adipisicing ullamco deserunt. Officia in nisi minim et commodo commodo occaecat ea aliqua ea.")))
                    ],
                  ))),
          // expandable text widget
        ],
      ),
      bottomNavigationBar: Container(
        height: Dimensions.bottomHeightBar,
        padding: EdgeInsets.only(
            top: Dimensions.height30,
            bottom: Dimensions.height30,
            left: Dimensions.width20,
            right: Dimensions.width20),
        decoration: BoxDecoration(
            color: AppColors.buttonBackgroundColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  color: Colors.white),
              child: Row(
                children: [
                  Icon(Icons.remove, color: AppColors.signColor),
                  SizedBox(width: Dimensions.width10 / 2),
                  BigText(text: "0"),
                  SizedBox(width: Dimensions.width10 / 2),
                  Icon(Icons.add, color: AppColors.signColor)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                  top: Dimensions.height20,
                  bottom: Dimensions.height20,
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              child: BigText(
                text: "\$10 | Add to cart",
                color: Colors.white,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius20),
                color: AppColors.mainColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
