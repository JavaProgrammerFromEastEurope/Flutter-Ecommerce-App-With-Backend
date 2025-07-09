import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_2_first/theme/app_colors.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  final TextOverflow textOverflow;
  BigText(
      {super.key,
      this.color = AppColors.mainBlackColor,
      required this.text,
      this.size = 20,
      this.textOverflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: textOverflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
