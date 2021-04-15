import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/pages/daqiqalar/daqiqalar_page.dart';
import 'package:ussd_uz/pages/home_screen/home_screen.dart';
import 'package:ussd_uz/pages/internet/internet_paketlar/internet_page.dart';
import 'package:ussd_uz/pages/language_page/language_screen.dart';
import 'package:ussd_uz/pages/main_screen/main_screen.dart';
import 'package:ussd_uz/pages/splash_screen/splash_screen.dart';
import 'package:ussd_uz/theme.dart';
import 'package:path_provider/path_provider.dart' as path_pro;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  final appDocDir=await path_pro.getApplicationDocumentsDirectory();
  Hive.init(appDocDir.path);
  runApp(MyApp());
  final box=await Hive.openBox("hive_db");
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
        DaqiqaPage.id:(context)=>DaqiqaPage.screen(firstPageColor,0)
      },
      home: SplashScreen.screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
