import 'package:flutter/material.dart';

class AyaItem extends StatelessWidget {
  String aya;

  AyaItem(this.aya);

  @override
  Widget build(BuildContext context) {
    return Text(
      aya,
      style: Theme.of(context)
          .textTheme
          .subtitle1
          ?.copyWith(letterSpacing: 1, fontStyle: FontStyle.italic),
      textAlign: TextAlign.center,
    );
  }
}
