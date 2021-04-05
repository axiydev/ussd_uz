import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/pages/home_screen/home_screen.dart';
import 'package:ussd_uz/pages/internet/internet_beeline/internet_page_beeline.dart';
import 'package:ussd_uz/pages/internet/internet_mobi/internet_mobi.dart';
import 'package:ussd_uz/pages/internet/internet_paketlar/internet_page.dart';
import 'package:ussd_uz/pages/internet/internet_perfectum/internet_page_perfetum.dart';
import 'package:ussd_uz/pages/internet/internet_ucell/internet_ucell.dart';
import 'package:ussd_uz/pages/language_page/language_screen.dart';
import 'package:ussd_uz/pages/main_screen/main_screen.dart';
import 'package:ussd_uz/pages/second_screen/second_screen.dart';
import 'package:ussd_uz/pages/splash_screen/splash_screen.dart';
import 'package:ussd_uz/pages/ussd/ussd_screen.dart';
import 'package:ussd_uz/pages/xizmatlar/xizmatlar_first/xizmatlar_page.dart';
import 'package:ussd_uz/theme.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final hvPathDir=await path_provider.getApplicationDocumentsDirectory();
  Hive.init(hvPathDir.path);
  await Hive.openBox("hive_db");
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
        InternetPageMobi.id:(context)=>InternetPageMobi.screen(secondPageColor),
        InternetPageUcell.id:(context)=>InternetPageUcell.screen(thirdPageColor),
        InternetPageBeeline.id:(context)=>InternetPageBeeline.screen(fourthPageColor),
        InternetPagePerfectum.id:(context)=>InternetPagePerfectum.screen(fivePageColor),
        SecondScreen.id:(context)=>SecondScreen.screen(),
        XizmatlarPage.id:(context)=>XizmatlarPage.screen(firstPageColor,0),
        UssdPage.id:(context)=>UssdPage.screen(firstPageColor,0),
      },
      home: SplashScreen.screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
