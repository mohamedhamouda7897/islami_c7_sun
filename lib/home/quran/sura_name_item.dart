import 'package:flutter/material.dart';

class SuraNameItem extends StatelessWidget {
  String name;

  SuraNameItem(this.name);

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.subtitle1,
    );
  }
}
