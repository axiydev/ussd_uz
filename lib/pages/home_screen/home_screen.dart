import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/pages/home_screen/home_provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
class HomeScreen extends StatefulWidget {
  static Widget screen()=>ChangeNotifierProvider<HomeProvider>(
      create:(context)=>HomeProvider(),
      child: HomeScreen(),
   );
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    final Size size =MediaQuery.of(context).size;
    return Consumer2<MainProvider,HomeProvider>(
      builder:(context,valueMain,valueHome,child)=>Scaffold(
        backgroundColor:valueMain.currentColInfo,
        body:LayoutBuilder(
          builder:(context,constrains)=>Stack(
          children: [
            Positioned(
              top:constrains.maxWidth==360&&constrains.maxHeight==640?size.width*0.01:size.width*0.05,
              child: Container(
                height:size.width*0.08,
                width: size.width,
                alignment: Alignment.center,
                child: Image(
                  image:AssetImage('assets/icons/uzmobile.png',),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: constrains.maxWidth==360&&constrains.maxHeight==640?size.width*0.09:size.width*0.14,
              child:Container(
                alignment: Alignment.center,
                height: size.width*0.05,
                width: size.width,
                child: Text('Ishonchli aloqa mobil operatori',textAlign: TextAlign.center,style: TextStyle(fontSize:size.width*0.035,fontWeight: FontWeight.w600,color:Colors.white),),
              ),
            ),
            Positioned(
              bottom: 0.0,
                child:Container(
                  height: size.width*0.5,
                  width: size.width,
                  color: Colors.white,
                ),
            ),
          ],
        ),
      )
      ),
    );
  }
}
