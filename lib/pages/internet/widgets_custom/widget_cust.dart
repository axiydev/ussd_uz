library custom_widget;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ussd_uz/models/internet_model.dart';

Widget myColumnWid(BuildContext context,{InternetPackages? package,required Color color}){
  final Size size=MediaQuery.of(context).size;
  return Container(
    height: size.width*0.3,
    width: size.width,
    child: Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            padding:EdgeInsets.all(15),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width*0.04),
                color: Colors.white,
                border: Border.all(color: Colors.grey,width: 0.1),
                boxShadow: [
                  BoxShadow(offset: Offset(0,3),blurRadius: 3,color: Colors.grey),
                ],
              ),
              child:Text('${package?.mb}',textAlign:TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: color),).center(),
            ),
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            padding:EdgeInsets.only(right: 10,top: 10,bottom: 10,left: 5),
            child: Container(
              height: double.infinity,
              padding:EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.width*0.04),
                color: Colors.white,
                border: Border.all(color: Colors.grey,width: 0.1),
                boxShadow: [
                  BoxShadow(offset: Offset(0,3),blurRadius: 3,color: Colors.grey),
                ],
              ),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('${package?.mb}',textAlign:TextAlign.center,style: TextStyle(fontSize:17,fontWeight: FontWeight.w600,color: color),),
                  Text('${package?.about}',style:TextStyle(fontSize: 13,color:Colors.grey[800])),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

extension onCenter on Widget{
  Widget center(){
    return Center(
      child: this,
    );
  }
}

extension onSort on List{
  List sorted(){
    this.sort();
    return this;
  }
}