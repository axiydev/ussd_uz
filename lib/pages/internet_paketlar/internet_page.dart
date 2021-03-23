import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet_model.dart';
import 'package:ussd_uz/pages/internet_paketlar/internet_provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
import 'package:ussd_uz/utils/mixinss.dart';
class InternetPage extends StatefulWidget {
  static const String id="internet_page";
  static Widget screen()=>ChangeNotifierProvider<InternetProvider>(
    create:(context)=>InternetProvider(),
    child: InternetPage(),
  );
  @override
  _InternetPageState createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> with AddMessText{
  List? other=[
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
    InternetPackages(mb:"500",about: "bu eng qulay tarif rejasi biz har doim mizozlarga yaxshi sharoit yaratishga harakat qilamiz"),
  ];
  PageController? controller;
  int currentIndex=0;
  List? lt=[
  "Salom dunyo",
  "Salom dunyo",
  "Salom dunyo",
  "Salom dunyo",
  "Salom dunyo",
  ];
  @override
 void initState(){
    super.initState();
    controller=PageController();
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Consumer<InternetProvider>(
      builder: (BuildContext context,valueInternet,child)=>Scaffold(
          appBar: AppBar(
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
                onPressed: (){},
                icon: Icon(Icons.info_outline),
                splashColor: Colors.red,
              ),
            ],
            title:Text('Internet paketlar'),
          ),
          body:SafeArea(
              child:Stack(
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
                            itemCount:other?.length,
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index]),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:size.width*0.23),
                        height: size.height,
                        width: size.width,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount:other?.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index]),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:size.width*0.23),
                        height: size.height,
                        width: size.width,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount:other?.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index]),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top:size.width*0.23),
                        height: size.height,
                        width: size.width,
                        color: Colors.white,
                        child: ListView.builder(
                          itemCount:other?.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index]),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
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
                            itemBuilder:(context,index)=>InkWell(child: _myWidget(context,isActive:index==valueInternet.getIn?true:false, str:lt![index],),onTap: (){
                              valueInternet.getEq(index);
                              controller?.animateToPage(valueInternet.getIn, duration:Duration(milliseconds: 200), curve:Curves.easeIn);
                              },),
                          ),
                        ),
                        Container(
                          height: size.width*0.13,
                          width: size.width,
                          color: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: size.width*0.2),
                          child:  Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: firstPageColor,
                            ),
                            width: double.infinity,
                            // ignore: deprecated_member_use
                            child: FlatButton(
                              onPressed: (){},
                              child: Text('Trafikni Aniqlash',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18),),
                            ),
                          ).center(),
                        ),
                      ],
                    ),
                  ),

                ],
              )
          )
      ),
    );
  }
}
Widget _myWidget(context,{required bool isActive,required String str}){
  return Consumer<InternetProvider>(
    builder: (context,value,child)=>Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration:BoxDecoration(
          border:Border(
            bottom:isActive?BorderSide(
              width: 3,
              color: firstPageColor,
            ):BorderSide(width: 3,color: Colors.white),
          )
      ),
      child:Text(str,style: TextStyle(color: firstPageColor),).center(),
    ),
  );
}
Widget myColumnWid(BuildContext context,{InternetPackages? package}){
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
              child:Text('${package?.mb}\nMB',textAlign:TextAlign.center,style: TextStyle(fontSize: 23,fontWeight: FontWeight.w600,color: firstPageColor),).center(),
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
              child: Text('${package?.about}',style:TextStyle(fontSize: 17,color: firstPageColor)).center(),
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