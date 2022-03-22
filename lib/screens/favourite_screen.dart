import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({Key? key, required this.favourites}) : super(key: key);
  List<Meal> favourites;
  @override
  Widget build(BuildContext context) {
    if (favourites.isEmpty) {
      return Container(
        child: 'No Favourite Meals Selected'
            .text
            .minFontSize(35)
            .center
            .makeCentered(),
      );
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          return MealItem(
            id: favourites[index].id,
            title: favourites[index].title,
            imageUrl: favourites[index].imageUrl,
            duration: favourites[index].duration,
            complexity: favourites[index].complexity,
            affordability: favourites[index].affordability,
          );
        },
        itemCount: favourites.length,
      );
    }
  }
}
