import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);
  Widget makeListTile(String title, IconData iconme) {
    return ListTile(
      leading: Icon(
        iconme,
        color: Colors.black,
      ),
      title: title.text.color(Colors.black).minFontSize(18).make(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      semanticLabel: 'Drawer',
      child: Column(
        children: [
          Container(
            height: Get.height * 0.25,
            width: double.infinity,
            color: Colors.redAccent,
            child: Center(
                child: 'Cooking Up!'
                    .text
                    .center
                    .fontFamily('Roboto-Condensed')
                    .fontWeight(FontWeight.bold)
                    .minFontSize(30)
                    .maxFontSize(32)
                    .make()),
          ),
          InkWell(
            child: makeListTile('Meals', Icons.restaurant),
            onTap: () {
              Get.offAllNamed('/');
            },
          ),
          InkWell(
            child: makeListTile('Filters', Icons.settings),
            onTap: () {
              Get.offAllNamed('/filter');
            },
          )
        ],
      ),
    );
  }
}
