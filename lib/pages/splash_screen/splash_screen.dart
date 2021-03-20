import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ussd_uz/pages/main_screen/main_screen.dart';
class SplashScreen extends StatefulWidget {
  static Widget screen()=>SplashScreen();
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with ShowTime{
  @override
  void initState(){
    super.initState();
    timeer(context, seconds: 2);
  }
  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage('assets/icons/splash.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child:Stack(
            children: [
              Positioned(
                  top: size.width*0.25,
                  child: Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: Container(
                      height: size.width*0.5,
                      width: size.width*0.5,
                      child: Image(
                        image:AssetImage('assets/icons/logo3.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
              ),
              Positioned(
                bottom: size.width*0.08,
                child:Container(
                   height: size.width*0.11,
                   width: size.width,
                   child:Container(
                     alignment: Alignment.center,
                     child: Image.asset('assets/icons/pdplogo_white.png',fit: BoxFit.cover,),
                   )
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}

mixin ShowTime{
  void timeer(BuildContext context,{required seconds}){
    Timer(Duration(seconds: seconds),(){
      Navigator.pushReplacementNamed(context,MainScreen.id);
    });
  }
}
