import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_maxi/widgets/custom_drawer.dart';
import 'package:meal_maxi/widgets/switch_tile.dart';
import 'package:velocity_x/velocity_x.dart';

class FilterScreen extends StatefulWidget {
  FilterScreen({Key? key, required this.getFilters, required this.saveFilters})
      : super(key: key);
  Function saveFilters;
  Map<String, bool> getFilters;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;
  @override
  @override
  void initState() {
    _glutenFree = (widget.getFilters['gluten']) as bool;
    _lactoseFree = (widget.getFilters['lactose']) as bool;
    _vegan = (widget.getFilters['vegan']) as bool;
    _vegetarian = (widget.getFilters['vegetarian']) as bool;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: 'Your Filters'.text.bold.make(),
          actions: [
            IconButton(
              onPressed: () {
                final _selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(_selectedFilters);
              },
              icon: const Icon(Icons.save),
            ),
          ],
        ),
        body: Column(
          children: [
            SizedBox(
              height: Get.height * 0.1,
              child: 'Adjust your meal selection'
                  .text
                  .minFontSize(22)
                  .fontWeight(FontWeight.w600)
                  .makeCentered(),
            ),
            CustomSwitchTile(
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meals',
              value: _glutenFree,
              updateValue: (v) {
                setState(() {
                  _glutenFree = v;
                });
              },
            ),
            CustomSwitchTile(
                title: 'Vegeterian',
                subtitle: 'Only include vegetarian meals',
                value: _vegetarian,
                updateValue: (v) {
                  setState(() {
                    _vegetarian = v;
                  });
                }),
            CustomSwitchTile(
                title: 'Lactose-Free',
                subtitle: 'Only include lactose-free meals',
                value: _lactoseFree,
                updateValue: (v) {
                  setState(() {
                    _lactoseFree = v;
                  });
                }),
            CustomSwitchTile(
                title: 'Vegan',
                subtitle: 'Only include vegan meals',
                value: _vegan,
                updateValue: (v) {
                  setState(() {
                    _vegan = v;
                  });
                }),
          ],
        ));
  }
}
