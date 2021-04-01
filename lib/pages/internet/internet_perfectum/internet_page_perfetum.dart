import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet_model.dart';
import 'package:ussd_uz/models/internet_screen_model.dart';
import 'package:ussd_uz/pages/home_screen/home_provider.dart';
import 'package:ussd_uz/pages/internet/internet_paketlar/internet_provider.dart';
import 'package:ussd_uz/pages/internet/widgets_custom/widget_cust.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
import 'package:ussd_uz/utils/hiveee/hive_dbb.dart';
import 'package:ussd_uz/utils/mixinss.dart';
import 'package:ussd_uz/utils/prefs/shared_pref.dart';

import 'internet_provider_perfectum.dart';
// ignore: must_be_immutable
class InternetPagePerfectum extends StatefulWidget {
  static const String id="internet_page_perfectum";
  late Color col;
  InternetPagePerfectum({required this.col});
  static Widget screen(Color col)=>ChangeNotifierProvider<InternetProviderPerfectum>(
    create:(context)=>InternetProviderPerfectum(),
    child: InternetPagePerfectum(col: col,),
  );
  @override
  _InternetPagePerfectumState createState() => _InternetPagePerfectumState();
}

class _InternetPagePerfectumState extends State<InternetPagePerfectum> with AddMessText,InfoShow{
  ComInter? comIn;
  List? month=[],internet=[];
  void getInfoInternetPack()async{
    comIn=HiveDB.loadInterInfo();
    print(comIn?.list.first.description);
    comIn?.list.forEach((i){
      if(i.operator==5&&i.muddat.split(" ").sorted()[0]=="30"&&i.category==7){
        month?.add(InternetPackages(mb:"${i.hajmi}",about: "To`plam narxi::${i.price}\nBerilgan trafik hajmi::${i.hajmi}\nAmal qilish muddati::har oy avtomatik",desc:"${i.description}"));
      }else if(i.operator==5&&i.category==8){
        internet?.add(InternetPackages(mb:"${i.hajmi}",about: "To`plam narxi::${i.price}\nBerilgan trafik hajmi::${i.hajmi}\nAmal qilish muddati::har oy avtomatik",desc:"${i.description}"));
      }
    });
  }
  PageController? controller;
  int currentIndex=0;
  List? lt=[
    "30 kunlik internet paketlar",
    "Internet paketlar",
  ];
  String t='reading our algorithms. What separates pseudocode from real code is that in pseudocode, we employ whatever expressive method is most clear and concise tospecify a given algorithm. Sometimes, the clearest method is English, so do notbe surprised if you come across an English phrase or sentence embedded withina section of real code. Another difference between pseudocode and real codeis that pseudocode is not typically concerned with issues of software engineering.Issues of data abstraction, modularity, and error handling are often ignored in orderto convey the essence of the algorithm more concisely.';
  String content='Info';
  @override
 void initState(){
    super.initState();
    controller=PageController();
    getInfoInternetPack();
  }
  @override
  Widget build(BuildContext context){
    final Size size=MediaQuery.of(context).size;
    return Consumer<InternetProviderPerfectum>(
      builder: (context,valueInternet,child){
        return Scaffold(
            appBar: AppBar(
              backgroundColor:widget.col,
              elevation:0.0,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: (){
                  Navigator.of(context).pop();
                },
                splashColor: Colors.red,
              ),
              centerTitle: false,
              actions: [
                IconButton(
                  onPressed: ()=>showInfo(context,t,content),
                  icon: Icon(Icons.info_outline),
                  splashColor: Colors.red,
                ),
              ],
              title:Text('Internet paketlar'),
            ),
            body:SafeArea(
              child: Stack(
                children: [
                  PageView(
                    controller: this.controller,
                    onPageChanged: (index){
                      valueInternet.getEq(index);
                      currentIndex=valueInternet.getIn;
                    },
                    children: [
                      Container(
                        margin: EdgeInsets.only(top:size.width*0.23),
                        height: size.height,
                        width: size.width,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount:month?.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: month![index],color: widget.col),onTap: ()=>showText(context,package: month![index],otherButton: 'Aktivlashtirish' ),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:size.width*0.23),
                        height: size.height,
                        width: size.width,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount:internet?.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: internet![index],color: widget.col),onTap: ()=>showText(context,package: internet![index],otherButton: 'Aktivlashtirish' ),),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: size.width,
                    height: size.height,
                    child:Column(
                      children: [
                        Container(
                          height: size.width*0.1,
                          color: Colors.white,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: lt?.length,
                            itemBuilder:(context,index)=>InkWell(child: _myWidget(context,color:widget.col,isActive:index==valueInternet.getIn?true:false, str:lt![index],),onTap: (){
                              valueInternet.getEq(index);
                              controller?.animateToPage(valueInternet.getIn, duration:Duration(milliseconds: 200), curve:Curves.easeIn);
                            },),
                          ),
                        ),

                        Container(
                          height: size.width*0.12,
                          width: size.width,
                          color: Colors.white,
                          margin: EdgeInsets.only(top:5),
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.2),
                          child:  Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: widget.col,
                            ),
                            width: double.infinity,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: (){},
                              child: Text('Internet Trafikni\nTekshirish',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
                            ),
                          ).center(),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
            ),
        );
      },
    );
  }
}
Widget _myWidget(context,{required bool isActive,required String str,required Color color}){
  return Consumer<InternetProviderPerfectum>(
    builder: (context,value,child)=>Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration:BoxDecoration(
          border:Border(
            bottom:isActive?BorderSide(
              width: 3,
              color: color,
            ):BorderSide(width: 3,color: Colors.white),
          )
      ),
      child:Text(str,style: TextStyle(color: color),).center(),
    ),
  );
}
mixin InfoShow{
  void showInfo(BuildContext context,[text,content]){
    showDialog(context: context,
        builder:(context)=>AlertDialog(
         title: Text(content),
         content: Text(text),
          actions: [
            // ignore: deprecated_member_use
            FlatButton(
              child: Text('orqaga'),
              onPressed: ()=>Navigator.of(context).pop(),
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
    );
  }
}
