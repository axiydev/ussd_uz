import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet/internet_model.dart';
import 'package:ussd_uz/pages/home_screen/home_screen.dart';
import 'package:ussd_uz/pages/internet/internet_beeline/internet_page_beeline.dart';
import 'package:ussd_uz/pages/internet/internet_mobi/internet_mobi.dart';
import 'package:ussd_uz/pages/internet/internet_paketlar/internet_page.dart';
import 'package:ussd_uz/pages/internet/internet_perfectum/internet_page_perfetum.dart';
import 'package:ussd_uz/pages/internet/internet_ucell/internet_ucell.dart';
import 'package:ussd_uz/pages/internet/widgets_custom/widget_cust.dart';
import 'package:ussd_uz/pages/language_page/language_screen.dart';
import 'package:ussd_uz/pages/main_screen/main_screen.dart';
import 'package:ussd_uz/pages/second_screen/second_screen.dart';
import 'package:ussd_uz/pages/sms_toplamlar/sms_page.dart';
import 'package:ussd_uz/pages/splash_screen/splash_screen.dart';
import 'package:ussd_uz/pages/tarif_rejalari/about_tarif/about_tarif.dart';
import 'package:ussd_uz/pages/tarif_rejalari/tarif_page.dart';
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
        SmsPage.id:(context)=>SmsPage.screen(firstPageColor,0),
        TarifPage.id:(context)=>TarifPage.screen(firstPageColor,0),
        AboutTarifPage.id:(context)=>AboutTarifPage.screen(firstPageColor,'assets/icons/splash.jpg',InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),)
      },
      home:SplashScreen.screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ExamplePage extends StatefulWidget {
  @override
  _ExamplePageState createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  List? ltX=[
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
    InternetPackages(mb:"500",about: "asjdkhsfhkdhdsf",desc: "jdlkshkjfjsgkfjhgsdhfdkhf"),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width:size.width,
          child:ListView.builder(
            itemCount: ltX?.length,
            itemBuilder:(context,index)=>myColumnWidTarif(context,color:Colors.blue,package: ltX![index]),
          ),
        ),
      ),
    );
  }
}

