import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
import 'package:ussd_uz/pages/third_screen/third_provider.dart';

class ThirdScreen extends StatefulWidget {
  static final String id='third_screen';

  static Widget screen()=>ChangeNotifierProvider<ThirdProvider>(
    create:(context)=>ThirdProvider(),
    child: ThirdScreen(),
  );
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Consumer2<MainProvider,ThirdProvider>(
      builder: (context,valueMain,valueThird,child)=>Scaffold(
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
                  image:AssetImage('assets/icons/ucell.png',),
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
                child: Text('Hayotni yaxshilik sari o`zgartirib!',textAlign: TextAlign.center,style: TextStyle(fontSize:size.width*0.035,fontWeight: FontWeight.w600,color:Colors.white),),
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
