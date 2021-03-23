import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/pages/five_page/five_provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
class FiveScreen extends StatefulWidget {
  static const String id="five_page";
  static Widget screen()=>ChangeNotifierProvider<FiveProvider>(
      create: (context)=>FiveProvider(),
      child: FiveScreen(),
  );
  @override
  _FiveScreenState createState() => _FiveScreenState();
}

class _FiveScreenState extends State<FiveScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Consumer2<MainProvider,FiveProvider>(
      builder: (context,valueMain,valueFive,child)=>Scaffold(
        backgroundColor:valueMain.currentColInfo,
        body:Stack(
          children: [
            Positioned(
              top: size.width*0.1,
              child: Container(
                height:size.width*0.08,
                width: size.width,
                alignment: Alignment.center,
                child: Image(
                  image:AssetImage('assets/icons/perfectum.png',),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: size.width*0.2,
              child:Container(
                alignment: Alignment.center,
                height: size.width*0.05,
                width: size.width,
                child: Text('Perfectum! Bugun! Abadiy!',textAlign: TextAlign.center,style: TextStyle(fontSize:size.width*0.035,fontWeight: FontWeight.w600,color:Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
