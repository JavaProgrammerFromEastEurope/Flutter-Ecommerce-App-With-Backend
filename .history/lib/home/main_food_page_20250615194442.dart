import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(
      child: const Container(
        child: Row(
          children: [
            Column(
              children: [],
            )
            const Container(
              width: 45,

            )
          ],
        ),
      ),
    );
  }
}
