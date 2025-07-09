import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({super.key,
    required this.icon,
    required this.backgroundColor,
    this.iconColor = const Color(value),
    this.size = 40});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
