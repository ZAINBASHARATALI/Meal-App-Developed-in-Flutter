import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_maxi/dummy_data.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class MealDetailScreen extends StatefulWidget {
  MealDetailScreen(
      {Key? key, required this.isFavourite, required this.toggleFavourite})
      : super(key: key);
  Function(String) isFavourite;
  Function(String) toggleFavourite;

  @override
  State<MealDetailScreen> createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  Widget builSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child:
          title.text.textStyle(Theme.of(context).textTheme.titleLarge!).make(),
    );
  }

  Widget buildContainer(Widget childy) {
    return Container(
      height: Get.height * 0.22,
      margin: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      padding: const EdgeInsets.symmetric(vertical: 1),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey)),
      child: childy,
    );
  }

  @override
  Widget build(BuildContext context) {
    final arg = Get.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((element) => element.id == arg);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.toggleFavourite(arg);
          setState(() {});
        },
        child: Icon(
          widget.isFavourite(arg) ? Icons.favorite : Icons.favorite_border,
          color: Colors.white,
          size: 28,
        ),
      ),
      appBar: AppBar(
        title: selectedMeal.title.text.make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
            builSectionTitle(context, 'ingredients'),
            buildContainer(ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  elevation: 4,
                  color: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: selectedMeal.ingredients[index].text.make(),
                  ),
                );
              },
              itemCount: selectedMeal.ingredients.length,
            )),
            builSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: ((context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: (index + 1).toString().text.make(),
                        ),
                        title: selectedMeal.steps[index].text.make(),
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  );
                }),
                itemCount: selectedMeal.steps.length,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
