import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_maxi/dummy_data.dart';
import 'package:meal_maxi/models/meal.dart';
import 'package:meal_maxi/screens/filter_screen.dart';
import 'package:meal_maxi/screens/meal_detail.dart';
import 'package:meal_maxi/screens/meal_screen.dart';
import 'package:meal_maxi/screens/tabs_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: unused_field
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _mealsAvailable = DUMMY_MEALS;
  // ignore: prefer_final_fields
  List<Meal> _favouriteMeals = [];

  // ignore: unused_element
  void _toggleFavourites(String mealid) {
    final getIndex = _favouriteMeals.indexWhere((meal) => meal.id == mealid);

    if (getIndex >= 0) {
      _favouriteMeals.removeAt(getIndex);
      setState(() {});
    } else {
      _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealid));
      setState(() {});
    }
  }

  bool _isFavourite(String id) {
    return _favouriteMeals.any((element) => element.id == id);
  }

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _mealsAvailable = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
        ),
        canvasColor: const Color.fromRGBO(
          255,
          254,
          229,
          1,
        ),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(
                color: Color.fromRGBO(
                  20,
                  51,
                  51,
                  1,
                ),
              ),
              bodyText2: const TextStyle(
                color: Color.fromRGBO(
                  20,
                  51,
                  51,
                  1,
                ),
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      home: TabsScreen(
        favouriteMeals: _favouriteMeals,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => TabsScreen(
            favouriteMeals: _favouriteMeals,
          ),
          arguments: _mealsAvailable,
        ),
        GetPage(
          name: '/meal',
          page: () => MealScreen(
            getmeals: _mealsAvailable,
          ),
        ),
        GetPage(
          name: '/detail',
          page: () => MealDetailScreen(
            isFavourite: _isFavourite,
            toggleFavourite: _toggleFavourites,
          ),
        ),
        GetPage(
          name: '/filter',
          page: () => FilterScreen(
            getFilters: _filters,
            saveFilters: _setFilters,
          ),
        ),
      ],
    );
  }
}
