import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet_model.dart';
import 'package:ussd_uz/models/internet_screen_model.dart';
import 'package:ussd_uz/pages/home_screen/home_provider.dart';
import 'package:ussd_uz/pages/internet_paketlar/internet_provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
import 'package:ussd_uz/utils/hiveee/hive_dbb.dart';
import 'package:ussd_uz/utils/mixinss.dart';
import 'package:ussd_uz/utils/prefs/shared_pref.dart';
// ignore: must_be_immutable
class InternetPage extends StatefulWidget {
  static const String id="internet_page";
  late Color col;
  InternetPage({required this.col});
  static Widget screen(Color col)=>ChangeNotifierProvider<InternetProvider>(
    create:(context)=>InternetProvider(),
    child: InternetPage(col: col,),
  );
  @override
  _InternetPageState createState() => _InternetPageState();
}

class _InternetPageState extends State<InternetPage> with AddMessText,InfoShow{
  ComInter? comIn;
  List? month=[],day=[],night=[];
  void getInfoInternetPack()async{
    comIn=HiveDB.loadInterInfo();
    print(comIn?.list.first.description);
    comIn?.list.forEach((i){
      if(i.operator==2&&i.muddat.split(" ")[0]=="30"){
        month?.add(InternetPackages(mb:"${i.hajmi}",about: "To`plam narxi::${i.price}\nBerilgan trafik hajmi::${i.hajmi}\nAmal qilish muddati::${i.muddat}",desc:"${i.description}"));
      }else if(i.operator==2&&i.muddat.split(" ")[0]=="1"){
        day?.add(InternetPackages(mb:"${i.hajmi}",about: "To`plam narxi::${i.price}\nBerilgan trafik hajmi::${i.hajmi}\nAmal qilish muddati::${i.muddat}",desc:"${i.description}"));
      }
    });
  }
  PageController? controller;
  int currentIndex=0;
  List? lt=[
    "Oylik paketlar",
    "Kunlik paketlar",
    "Tungi internet",
    "TAS-IX uchun paketlar",
    "Internet non-stop",
    "TA`LIM tarif rejasi uchun maxsus paketlar",
    "Constructor TR abanentlari uchun internet paketlar",
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
    final val=Provider.of<InternetProvider>(context);
    return Consumer<InternetProvider>(
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
                          itemCount:day?.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: day![index],color: widget.col),onTap: ()=>showText(context,package: day![index],otherButton: 'Aktivlashtirish' ),),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.only(top:size.width*0.23),
                      //   height: size.height,
                      //   width: size.width,
                      //   color: Colors.white,
                      //   child: ListView.builder(
                      //     itemCount:other?.length,
                      //     shrinkWrap: true,
                      //     physics: AlwaysScrollableScrollPhysics(),
                      //     itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index],color: widget.col),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top:size.width*0.23),
                      //   height: size.height,
                      //   width: size.width,
                      //   color: Colors.white,
                      //   child: ListView.builder(
                      //     itemCount:other?.length,
                      //     shrinkWrap: true,
                      //     physics: AlwaysScrollableScrollPhysics(),
                      //     itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index],color:widget.col),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top:size.width*0.23),
                      //   height: size.height,
                      //   width: size.width,
                      //   color: Colors.white,
                      //   child: ListView.builder(
                      //     itemCount:other?.length,
                      //     shrinkWrap: true,
                      //     physics: AlwaysScrollableScrollPhysics(),
                      //     itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index],color: widget.col),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top:size.width*0.23),
                      //   height: size.height,
                      //   width: size.width,
                      //   color: Colors.white,
                      //   child: ListView.builder(
                      //     itemCount:other?.length,
                      //     shrinkWrap: true,
                      //     physics: AlwaysScrollableScrollPhysics(),
                      //     itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index],color: widget.col),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
                      //   ),
                      // ),
                      // Container(
                      //   margin: EdgeInsets.only(top:size.width*0.23),
                      //   height: size.height,
                      //   width: size.width,
                      //   color: Colors.white,
                      //   child: ListView.builder(
                      //     itemCount:other?.length,
                      //     shrinkWrap: true,
                      //     physics: AlwaysScrollableScrollPhysics(),
                      //     itemBuilder:(context,index)=>GestureDetector(child: myColumnWid(context,package: other![index],color: widget.col),onTap: ()=>showText(context,package: other![index],otherButton: 'Aktivlashtirish' ),),
                      //   ),
                      // ),
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
                              child: Text('Trafikni Aniqlash',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
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
  return Consumer<InternetProvider>(
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