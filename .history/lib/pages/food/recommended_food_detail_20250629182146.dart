import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/theme/app_colors.dart';
import 'package:flutter_ecommerce_2_first/utils/dimensions.dart';
import 'package:flutter_ecommerce_2_first/widgets/big_text.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                margin: EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20),
                color: Colors.white,
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                child: Center(
                    child:
                        BigText(size: Dimensions.font26, text: "Chinese Side")),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/img/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
                "Tender cuts of chicken are bathed in a rich, creamy yogurt marinade infused with a bold blend of spices. Fragrant garlic and ginger combine with warm notes of cumin, coriander, paprika, and a hint of chili to create a depth of flavor that penetrates every bite. The yogurt not only tenderizes the meat but also locks in moisture, ensuring the chicken remains juicy and succulent during cooking. After hours of marination, the chicken is grilled (or baked) to perfection, developing a slightly charred exterior while staying melt-in-your-mouth tender inside. The result is a harmonious balance of heat, tang, and savoriness, perfect on its own or served with warm naan, fragrant basmati rice, or a crisp salad. This dish offers a satisfying fusion of traditional spice and modern comfort—a simple yet elevated take on a timeless classic.Tender cuts of chicken are bathed in a rich, creamy yogurt marinade infused with a bold blend of spices. Fragrant garlic and ginger combine with warm notes of cumin, coriander, paprika, and a hint of chili to create a depth of flavor that penetrates every bite. The yogurt not only tenderizes the meat but also locks in moisture, ensuring the chicken remains juicy and succulent during cooking. After hours of marination, the chicken is grilled (or baked) to perfection, developing a slightly charred exterior while staying melt-in-your-mouth tender inside. The result is a harmonious balance of heat, tang, and savoriness, perfect on its own or served with warm naan, fragrant basmati rice, or a crisp salad. This dish offers a satisfying fusion of traditional spice and modern comfort—a simple yet elevated take on a timeless classic.Tender cuts of chicken are bathed in a rich, creamy yogurt marinade infused with a bold blend of spices. Fragrant garlic and ginger combine with warm notes of cumin, coriander, paprika, and a hint of chili to create a depth of flavor that penetrates every bite. The yogurt not only tenderizes the meat but also locks in moisture, ensuring the chicken remains juicy and succulent during cooking. After hours of marination, the chicken is grilled (or baked) to perfection, developing a slightly charred exterior while staying melt-in-your-mouth tender inside. The result is a harmonious balance of heat, tang, and savoriness, perfect on its own or served with warm naan, fragrant basmati rice, or a crisp salad. This dish offers a satisfying fusion of traditional spice and modern comfort—a simple yet elevated take on a timeless classic."),
          ),
        ],
      ),
    );
  }
}
