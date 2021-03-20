import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/pages/fourth_page/fourth_provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
class FourthScreen extends StatefulWidget {
  static const String id="fourth_page";
  static Widget screen()=>ChangeNotifierProvider(
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
        body:Stack(
          children: [
            Positioned(
              top: size.width*0.1,
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
              top: size.width*0.2,
              child:Container(
                alignment: Alignment.center,
                height: size.width*0.05,
                width: size.width,
                child: Text('Yetakchi.Ishonchli.Innovatsion.',textAlign: TextAlign.center,style: TextStyle(fontSize:size.width*0.035,fontWeight: FontWeight.w600,color:Colors.white),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
