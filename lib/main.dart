import 'package:flutter/material.dart';
import 'package:ussd_uz/pages/home_screen/home_screen.dart';
import 'package:ussd_uz/pages/internet_paketlar/internet_page.dart';
import 'package:ussd_uz/pages/language_page/language_screen.dart';
import 'package:ussd_uz/pages/main_screen/main_screen.dart';
import 'package:ussd_uz/pages/splash_screen/splash_screen.dart';
import 'package:ussd_uz/theme.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:basicTheme(context),
      routes: {
        MainScreen.id:(context)=>MainScreen.screen(),
        InternetPage.id:(context)=>InternetPage.screen(),
      },
      home: MainScreen.screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
