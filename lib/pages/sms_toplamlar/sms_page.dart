import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet/InfoModel.dart';
import 'package:ussd_uz/models/internet/internet_model.dart';
import 'package:ussd_uz/models/internet/internet_screen_model.dart';
import 'package:ussd_uz/models/service/service_model.dart';
import 'package:ussd_uz/models/sms/sms_model.dart';
import 'package:ussd_uz/pages/home_screen/home_provider.dart';
import 'package:ussd_uz/pages/internet/internet_paketlar/internet_provider.dart';
import 'package:ussd_uz/pages/internet/widgets_custom/widget_cust.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
import 'package:ussd_uz/pages/sms_toplamlar/sms_provider.dart';
import 'package:ussd_uz/pages/xizmatlar/xizmatlar_first/xizmatlar_provider.dart';
import 'package:ussd_uz/utils/hiveee/hive_dbb.dart';
import 'package:ussd_uz/utils/mixinss.dart';
import 'package:ussd_uz/utils/prefs/shared_pref.dart';
// ignore: must_be_immutable
class SmsPage extends StatefulWidget {
  static const String id="sms_page";
  late Color col;
  late int ind;
  SmsPage({required this.col,required this.ind});
  static Widget screen(Color col,int index)=>ChangeNotifierProvider<SmsProvider>(
    create:(context)=>SmsProvider(),
    child: SmsPage(col: col,ind:index),
  );
  @override
  _SmsPageState createState() => _SmsPageState();
}
//#tayyot
class _SmsPageState extends State<SmsPage> with AddMessText,InfoShow{
  SmsMod? smsMod;
  SmsModCategory? smsModCategory;
  List? lt=[];
  List? listInfo=[],
      listEmp1=[],
      listEmp2=[],
      listEmp3=[],
      listEmp4=[],
      listEmp5=[],
      listEmp6=[],
      listEmp7=[],
      listEmp8=[],
      listEmp9=[],
      listEmp10=[],
      listEmp11=[],
      listEmp12=[];
  void getInfoServicePack()async{
   smsMod=HiveDB.loadSmsInfo();
   smsModCategory=HiveDB.loadSmsCategoryInfo();
   if(widget.ind==0) {
     smsModCategory?.list.forEach((item) {
       if(item.operator==2){
         lt?.add(InfoModel(name: item.name,info: item.info));
       }
     });
     smsMod?.list.forEach((i) {
           if(i.operator==2&&i.category==5) {
             listEmp1?.add(
                 InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
           }else if(i.operator==2&&i.category==6) {
             listEmp2?.add(
                 InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
           }else if(i.operator==2&&i.category==7){
             listEmp3?.add(
                 InternetPackages(mb:"${i.ussdCode}",about: "${i.name}",desc: '${i.description}'));
           }else if(i.operator==2&&i.category==8){
             listEmp4?.add(
                 InternetPackages(mb:"${i.ussdCode}",about: "${i.name}",desc: '${i.description}'));
           }
   });
         listInfo?.add(listEmp1);
         listInfo?.add(listEmp2);
         listInfo?.add(listEmp3);
         listInfo?.add(listEmp4);
  }else if(widget.ind==1){
     smsModCategory?.list.forEach((item) {
       if(item.operator==1){
         lt?.add(InfoModel(name: item.name,info: item.info));
       }
     });
     smsMod?.list.forEach((i) {
       if(i.operator==1&&i.category==2) {
         listEmp5?.add(
             InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
       }
     });
     listInfo?.add(listEmp5);
   }
     else if(widget.ind==2){
     smsModCategory?.list.forEach((item) {
       if(item.operator==3){
         lt?.add(InfoModel(name: item.name,info: item.info));
       }
     });
     smsMod?.list.forEach((i) {
       if(i.operator==3&&i.category==12) {
         listEmp6?.add(
             InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
       }else if(i.operator==3&&i.category==13) {
         listEmp7?.add(
             InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
       }else if(i.operator==3&&i.category==14) {
         listEmp8?.add(
             InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
       }
     });
     listInfo?.add(listEmp6);
     listInfo?.add(listEmp7);
     listInfo?.add(listEmp8);
   }else if(widget.ind==3){
     smsModCategory?.list.forEach((item) {
       if(item.operator==4){
         lt?.add(InfoModel(name: item.name,info: item.info));
       }
     });
     smsMod?.list.forEach((i) {
       if(i.operator==4&&i.category==9) {
         listEmp9?.add(
             InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
       }else if(i.operator==4&&i.category==10) {
         listEmp10?.add(
             InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
       }else if(i.operator==4&&i.category==11) {
         listEmp11?.add(
             InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
       }
     });
     listInfo?.add(listEmp9);
     listInfo?.add(listEmp10);
     listInfo?.add(listEmp11);
   }else if(widget.ind==4){
     smsModCategory?.list.forEach((item) {
       if(item.operator==5){
         lt?.add(InfoModel(name: item.name,info: item.info));
       }
     });
     smsMod?.list.forEach((i) {
       if(i.operator==5&&i.category==4) {
         listEmp12?.add(
             InternetPackages(mb: "${i.ussdCode}",
                 about: "${i.name}",
                 desc: '${i.description}'));
       }
     });
     listInfo?.add(listEmp12);
   }
  }
  PageController? controller;
  int currentIndex=0;
  String t='Uzmobile kompaniyasi internet paketlari';
  String content='Info';
  @override
  void initState(){
    super.initState();
    controller=PageController();
    getInfoServicePack();
  }
  @override
  Widget build(BuildContext context){
    final Size size=MediaQuery.of(context).size;
    return Consumer<SmsProvider>(
      builder: (context,valueSms,child){
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
                onPressed: ()=>showInfo(context,valueSms.getInfoStr,content),
                icon: Icon(Icons.info_outline),
                splashColor: Colors.red,
              ),
            ],
            title:Text('Sms'),
          ),
          body:SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: this.controller,
                  onPageChanged: (index){
                    valueSms.getEq(index,lt![index].info);
                    currentIndex=valueSms.getIn;
                  },
                  children: [
                   for(int i=0;i<lt!.length;i++)Container(
                     margin: EdgeInsets.only(top:size.width*0.23),
                     height: size.height,
                     width: size.width,
                     color: Colors.white,
                     child: ListView.builder(
                       itemCount:listInfo![i]?.length,
                       shrinkWrap: true,
                       physics: AlwaysScrollableScrollPhysics(),
                       itemBuilder:(context,index)=>GestureDetector(child: myColumnWidService(context,package: listInfo![i][index],color: widget.col),onTap: ()=>showTextService(context,package: listInfo![i][index],otherButton: 'Aktivlashtirish' ),),
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
                          itemBuilder:(context,index)=>InkWell(child: _myWidget(context,color:widget.col,isActive:index==valueSms.getIn?true:false, str:lt![index].name,),onTap: (){
                            valueSms.getEq(index,lt![index].info);
                            controller?.animateToPage(valueSms.getIn, duration:Duration(milliseconds: 200), curve:Curves.easeIn);
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
                            child: Text('Sms qoldig`ini tekshirish',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
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
  return Consumer<SmsProvider>(
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
