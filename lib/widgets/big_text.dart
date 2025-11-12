import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../utils/dimensions.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double? size;
  final TextOverflow overflow;

  const BigText({
    super.key,
    required this.text,
    this.color = AppColors.mainBlackColor,
    this.size,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: size ?? Dimensions.font16,
        color: color,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
