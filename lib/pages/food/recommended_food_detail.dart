import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/img/food0.png",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),),
          SliverToBoxAdapter(
            child: Text("Tender cuts of chicken are bathed in a rich, creamy yogurt marinade infused with a bold blend of spices. Fragrant garlic and ginger combine with warm notes of cumin, coriander, paprika, and a hint of chili to create a depth of flavor that penetrates every bite. The yogurt not only tenderizes the meat but also locks in moisture, ensuring the chicken remains juicy and succulent during cooking. After hours of marination, the chicken is grilled (or baked) to perfection, developing a slightly charred exterior while staying melt-in-your-mouth tender inside. The result is a harmonious balance of heat, tang, and savoriness, perfect on its own or served with warm naan, fragrant basmati rice, or a crisp salad. This dish offers a satisfying fusion of traditional spice and modern comfort—a simple yet elevated take on a timeless classic."
            ),
          ),
        ],
      ),
    );
  }
}