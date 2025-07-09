import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/theme/app_colors.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      height: 320,
      child: PageView.builder(
          itemCount: 5,
          itemBuilder: (context, position) {
            return _buidPageItem(position);
          }),
    );
  }

  Widget _buidPageItem(int index) {
    return Stack(
      children: [
        Container(
          //height: 220,
          margin: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? AppColors.iconColor1 : AppColors.mainColor,
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/img/food0.png"))),
        ),
      ],
    );
  }
}
