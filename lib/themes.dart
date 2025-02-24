import 'package:flutter/material.dart';

ThemeData light(BuildContext context) {
  return ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.pink,
      centerTitle: false,
      shadowColor: Colors.transparent,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
    ),
  );
}

ThemeData dark(BuildContext context) {
  return ThemeData.dark();
}
