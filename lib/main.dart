import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/pages/home_screen/home_screen.dart';
import 'package:ussd_uz/pages/internet_paketlar/internet_page.dart';
import 'package:ussd_uz/pages/language_page/language_screen.dart';
import 'package:ussd_uz/pages/main_screen/main_screen.dart';
import 'package:ussd_uz/pages/second_screen/second_screen.dart';
import 'package:ussd_uz/pages/splash_screen/splash_screen.dart';
import 'package:ussd_uz/theme.dart';

void main()async{
  // await Hive.initFlutter();
  // await Hive.openBox("hive_db");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:basicTheme(context),
      routes: {
        MainScreen.id:(context)=>MainScreen.screen(),
        InternetPage.id:(context)=>InternetPage.screen(firstPageColor),
        SecondScreen.id:(context)=>SecondScreen.screen(),
      },
      home: SplashScreen.screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
