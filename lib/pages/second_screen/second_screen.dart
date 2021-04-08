import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
import 'package:ussd_uz/pages/second_screen/second_provider.dart';
class SecondScreen extends StatefulWidget {
  static const String id="second_screen";
  static Widget screen()=>ChangeNotifierProvider<SecondProvider>(
    create:(context)=>SecondProvider(),
    child: SecondScreen(),
  );
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Consumer2<MainProvider,SecondProvider>(
      builder: (context,valueMain,valueSecond,child)=>Scaffold(
        backgroundColor:valueMain.currentColInfo,
        body:Stack(
          children: [
            Positioned(
              top: size.width*0.05,
              child: Container(
                height:size.width*0.08,
                width: size.width,
                alignment: Alignment.center,
                child: Image(
                  image:AssetImage('assets/icons/mobiuz.png',),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: size.width*0.14,
              child:Container(
                alignment: Alignment.center,
                height: size.width*0.05,
                width: size.width,
                child: Text('Raqamli imkoniyatlar sari',textAlign: TextAlign.center,style: TextStyle(fontSize:size.width*0.035,fontWeight: FontWeight.w600,color:Colors.white),),
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
      ),
    );
  }
}
