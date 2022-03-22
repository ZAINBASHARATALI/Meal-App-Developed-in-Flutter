import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';

import '../screens/meal_screen.dart';

class Category extends StatelessWidget {
  final String id;
  final Color color;
  final String title;
  const Category(
      {Key? key, required this.id, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/meal', arguments: [id, title]);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: title.text.xl3.bold.fontFamily('RobotoCondensed').make(),
      ),
    );
  }
}
