import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

ThemeData basicTheme(BuildContext context)=>ThemeData(
  primarySwatch: Colors.blue,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    elevation: 0.0,
    backgroundColor: Colors.white,
  ),
  cardTheme: CardTheme(
    elevation: 0.0,
  ),
);