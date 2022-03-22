import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_maxi/models/meal.dart';
import 'package:meal_maxi/screens/category_list.dart';
import 'package:meal_maxi/widgets/custom_drawer.dart';

import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  TabsScreen({
    Key? key,
    required this.favouriteMeals,
  }) : super(key: key);

  List<Meal> favouriteMeals;

  @override
  // ignore: no_logic_in_create_state
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Meal> getmeals = Get.arguments;
  Widget? childy;
  late List<Map<String, Object>> pages;
  int selectedIndex = 0;
  @override
  void initState() {
    pages = [
      {
        "page": const CategoryList(),
        "title": 'Categories',
      },
      {
        "page": FavouriteScreen(
          favourites: widget.favouriteMeals,
        ),
        "title": 'Your Favourites',
      }
    ];
    childy = pages[0]['page'] as Widget;
    super.initState();
  }

  void changeNavigation(int index) {
    setState(() {
      selectedIndex = index;
      childy = pages[selectedIndex]['page'] as Widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(pages[selectedIndex]['title'].toString()),
        centerTitle: true,
      ),
      body: childy,
      bottomNavigationBar: FluidNavBar(
        defaultIndex: selectedIndex,
        onChange: changeNavigation,
        style: FluidNavBarStyle(
            //iconBackgroundColor: Colors.white,
            barBackgroundColor: Theme.of(context).colorScheme.primary,
            iconSelectedForegroundColor: Colors.white),
        icons: [
          FluidNavBarIcon(
            icon: Icons.category,
            extras: {"label": "Categories"},
          ),
          FluidNavBarIcon(
            icon: Icons.favorite,
            extras: {"label": "Categories"},
          ),
        ],
      ),
    );
  }
}
