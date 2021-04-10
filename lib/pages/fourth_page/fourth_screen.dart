import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/pages/fourth_page/fourth_provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
class FourthScreen extends StatefulWidget {
  static const String id="fourth_page";
  static Widget screen()=>ChangeNotifierProvider<FourthProvider>(
      create:(context)=>FourthProvider(),
      child: FourthScreen(),
  );
  @override
  _FourthScreenState createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Consumer2<MainProvider,FourthProvider>(
      builder: (context,valueMain,valueFourth,child)=>Scaffold(
        backgroundColor:valueMain.currentColInfo,
        body:LayoutBuilder(builder:(context,constrains)=>Stack(
          children: [
            Positioned(
              top: constrains.maxWidth==360&&constrains.maxHeight==640?size.width*0.01:size.width*0.05,
              child: Container(
                height:size.width*0.08,
                width: size.width,
                alignment: Alignment.center,
                child: Image(
                  image:AssetImage('assets/icons/beeline.png',),
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
                child: Text('Yetakchi.Ishonchli.Innovatsion.',textAlign: TextAlign.center,style: TextStyle(fontSize:size.width*0.035,fontWeight: FontWeight.w600,color:Colors.white),),
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
      )),
    );
  }
}
