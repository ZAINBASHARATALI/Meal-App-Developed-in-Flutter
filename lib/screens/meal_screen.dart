import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_maxi/models/meal.dart';
import 'package:meal_maxi/widgets/meal_item.dart';

// ignore: must_be_immutable
class MealScreen extends StatefulWidget {
  MealScreen({Key? key, required this.getmeals}) : super(key: key);
  var arumentdata = Get.arguments;
  List<Meal> getmeals;

  @override
  State<MealScreen> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  // ignore: prefer_typing_uninitialized_variables
  var categoryMeals;
  @override
  void didChangeDependencies() {
    categoryMeals = widget.getmeals.where((meals) {
      return meals.categories.contains(widget.arumentdata[0]);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void removeItem(String id) {
      setState(() {
        categoryMeals.removeWhere((element) => element.id == id);
      });
    }

    debugPrint(widget.arumentdata[0] + '   ' + widget.arumentdata[1]);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.arumentdata[1]),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Get.toNamed(
                '/detail',
                arguments: categoryMeals[index].id,
              )?.then((value) {
                if (value != null) {
                  removeItem(value);
                }
                return value;
              });
            },
            child: MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              complexity: categoryMeals[index].complexity,
              affordability: categoryMeals[index].affordability,
            ),
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
