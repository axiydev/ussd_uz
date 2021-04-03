import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet/internet_model.dart';

mixin AddMessText{
  void showText(BuildContext context,{required InternetPackages package,String? otherButton,bool isUssd=false}){
    showDialog(
      context:context,
      builder:(context)=>SimpleDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child:Text("${package.getStrMb}"),
            ),
            Flexible(
                child:IconButton(
                 onPressed: (){
                 Share.share('${package.getStrMb}',subject: "Ulashish");
                  },
                icon:Icon(Icons.share),
            ),
            ),
          ],
        ),
        children: [
          Container(
            padding: EdgeInsets.only(left: 20,right: 20,),
            margin: EdgeInsets.only(bottom: 20),
            child: Text('${package.getStrAbout}\n${package.getStrDesc}',textAlign: TextAlign.start,style: TextStyle(fontSize: 14),),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            height: 50,
            // ignore: deprecated_member_use
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              onPressed: (){},
              color:secondPageColor,
              child:Text('$otherButton',style: TextStyle(color: Colors.white,fontSize: 19),),
              splashColor: Colors.blue,
            ),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: ()=>Navigator.pop(context),
              child: Text('orqaga',style: TextStyle(color: Colors.redAccent,fontSize: 15),),
            ),
          )
        ],
      )
    );
  }
}