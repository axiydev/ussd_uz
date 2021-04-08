import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet/InfoModel.dart';
import 'package:ussd_uz/models/internet/internet_model.dart';
import 'package:ussd_uz/models/internet/internet_screen_model.dart';
import 'package:ussd_uz/models/service/service_model.dart';
import 'package:ussd_uz/models/tarif/tarif_model.dart';
import 'package:ussd_uz/pages/home_screen/home_provider.dart';
import 'package:ussd_uz/pages/internet/internet_paketlar/internet_provider.dart';
import 'package:ussd_uz/pages/internet/widgets_custom/widget_cust.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
import 'package:ussd_uz/pages/tarif_rejalari/about_tarif/about_tarif.dart';
import 'package:ussd_uz/pages/tarif_rejalari/tarif_provider.dart';
import 'package:ussd_uz/pages/xizmatlar/xizmatlar_first/xizmatlar_provider.dart';
import 'package:ussd_uz/utils/hiveee/hive_dbb.dart';
import 'package:ussd_uz/utils/mixinss.dart';
import 'package:ussd_uz/utils/prefs/shared_pref.dart';
// ignore: must_be_immutable
class TarifPage extends StatefulWidget {
  static const String id="tarif_page";
  late Color col;
  late int ind;
  TarifPage({required this.col,required this.ind});
  static Widget screen(Color col,int index)=>ChangeNotifierProvider<TarifProvider>(
    create:(context)=>TarifProvider(),
    child: TarifPage(col: col,ind:index),
  );
  @override
  _TarifPageState createState() => _TarifPageState();
}
//#tayyot
class _TarifPageState extends State<TarifPage> with AddMessText,InfoShow{
  TarifMod? tarifMod;
  List? lt=[];
  List? listInfo=[],
      listEmp1=[],
      listEmp2=[],
      listEmp3=[],
      listEmp4=[],
      listEmp5=[];
  void getInfoServicePack()async{
   tarifMod=HiveDB.loadTarifInfo();
   if(widget.ind==0) {
     lt?.addAll([
       InfoModel(name:"Faol tariflar", info:"Faol tariflar,"),
     ]);
     tarifMod?.list.forEach((i) {
           if(i.operator==2) {
             listEmp1?.add(
                 InternetPackages.redir(
                     mb:"${i.name}",
                     about: "${i.ussdCode}",
                     desc: '${i.description}',
                     img:'${i.image}'
                 ));
           }
   });
         listInfo?.add(listEmp1);
   } else if(widget.ind==1){
     lt?.addAll([
       InfoModel(name:"Faol tariflar", info:"Faol tariflar,"),
     ]);
     tarifMod?.list.forEach((i) {
       if(i.operator==1) {
         listEmp2?.add(
             InternetPackages.redir(
                 mb:"${i.name}",
                 about: "${i.ussdCode}",
                 desc: '${i.description}',
                 img:'${i.image}'
  ));
       }
     });
     listInfo?.add(listEmp2);
   }
  else if(widget.ind==2){
     lt?.addAll([
       InfoModel(name:"Faol tariflar", info:"Faol tariflar,"),
     ]);
     tarifMod?.list.forEach((i) {
       if(i.operator==3) {
         listEmp3?.add(
             InternetPackages.redir(
                 mb:"${i.name}",
                 about: "${i.ussdCode}",
                 desc: '${i.description}',
                 img:'${i.image}'
             ));
       }
     listInfo?.add(listEmp3);
     });
  }else if(widget.ind==3){
     lt?.addAll([
       InfoModel(name:"Faol tariflar", info:"Faol tariflar,"),
     ]);
     tarifMod?.list.forEach((i) {
       if(i.operator==4) {
         listEmp4?.add(
             InternetPackages.redir(
                 mb:"${i.name}",
                 about: "${i.ussdCode}",
                 desc: '${i.description}',
                 img:'${i.image}'
             ));
       }});
     listInfo?.add(listEmp4);

   }else if(widget.ind==4){
     lt?.addAll([
       InfoModel(name:"Faol tariflar", info:"Faol tariflar,"),
     ]);
     tarifMod?.list.forEach((i) {
       if(i.operator==5) {
         listEmp5?.add(
             InternetPackages.redir(
                 mb:"${i.name}",
                 about: "${i.ussdCode}",
                 desc: '${i.description}',
                 img:'${i.image}'
             ));
       }
     });
     listInfo?.add(listEmp5);
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
    return Consumer<TarifProvider>(
      builder: (context,valueService,child){
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
                onPressed: ()=>showInfo(context,valueService.getInfoStr,content),
                icon: Icon(Icons.info_outline),
                splashColor: Colors.red,
              ),
            ],
            title:Text('Tariflar'),
          ),
          body:SafeArea(
            child: Stack(
              children: [
                PageView(
                  controller: this.controller,
                  onPageChanged: (index){
                    valueService.getEq(index,lt![index].info);
                    currentIndex=valueService.getIn;
                  },
                  children: [
                   for(int i=0;i<lt!.length;i++)Container(
                     margin: EdgeInsets.only(top:size.width*0.1),
                     height: size.height,
                     width: size.width,
                     color: Colors.white,
                     child: ListView.builder(
                       itemCount:listInfo![i]?.length,
                       shrinkWrap: true,
                       physics: AlwaysScrollableScrollPhysics(),
                       itemBuilder:(context,index)=>Hero(tag:"${listInfo![i][index].mb}}",child: GestureDetector(child: myColumnWidTarif(context,package: listInfo![i][index],color: widget.col),
                         onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder:(context)=>AboutTarifPage.screen(widget.col,listInfo![i][index].img,listInfo![i][index]))),),)
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
                          itemBuilder:(context,index)=>InkWell(child: _myWidget(context,color:widget.col,isActive:index==valueService.getIn?true:false, str:lt![index].name,),onTap: (){
                            valueService.getEq(index,lt![index].info);
                            controller?.animateToPage(valueService.getIn, duration:Duration(milliseconds: 200), curve:Curves.easeIn);
                          },),
                        ),
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
  return Consumer<TarifProvider>(
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
