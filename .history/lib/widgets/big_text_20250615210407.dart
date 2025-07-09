import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final Color? color;
  final String? text;
  double size;
  TextOverflow textOverflow;
  const BigText({super.key, this.color, this.text, this.textOverflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text();
  }
}
