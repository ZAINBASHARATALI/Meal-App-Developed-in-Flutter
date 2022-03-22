import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_maxi/widgets/category_item.dart';
import 'package:meal_maxi/dummy_data.dart';

import '../models/meal.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
        bottom: 15,
      ),
      child: GridView(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: Get.width * 0.4,
          childAspectRatio: 1.3,
          mainAxisSpacing: Get.width * 0.06,
          crossAxisSpacing: Get.width * 0.06,
        ),
        children: DUMMY_CATEGORIES.map((e) {
          return Category(id: e.id, title: e.title, color: e.color);
        }).toList(),
      ),
    );
  }
}
