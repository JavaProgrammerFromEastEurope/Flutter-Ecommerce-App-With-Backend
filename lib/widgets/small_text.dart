import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class SmallText extends StatelessWidget {
  final String text;
  final Color color;
  final double size;
  final double height;

  const SmallText({
    super.key,
    required this.text,
    this.color = AppColors.paraColor,
    this.size = 12,
    this.height = 1.2,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(color: color, fontSize: size, height: height));
  }
}
