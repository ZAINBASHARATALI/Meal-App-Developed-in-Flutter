import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class CustomSwitchTile extends StatelessWidget {
  CustomSwitchTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.updateValue,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var value;
  final String title;
  final String subtitle;
  Function(bool) updateValue;
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      activeColor: Colors.redAccent,
      value: value,
      onChanged: updateValue,
      title: title.text.minFontSize(18).make(),
      subtitle: subtitle.text.make(),
    );
  }
}
