import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet/internet_model.dart';
import 'package:ussd_uz/models/ussd/ussd_common.dart';
import 'package:ussd_uz/pages/internet/widgets_custom/widget_cust.dart';
import 'package:ussd_uz/pages/ussd/ussd_provider.dart';
import 'package:ussd_uz/utils/hiveee/hive_dbb.dart';
import 'package:ussd_uz/utils/mixinss.dart';

class UssdPage extends StatefulWidget {
  static const String id='ussd_page';
  late Color col;
  late int indexPage;
  UssdPage({required this.col,required this.indexPage});
  static Widget screen(Color color,int index)=>ChangeNotifierProvider<UssdProvider>(
    create:(context)=>UssdProvider(),
    child: UssdPage(col:color,indexPage: index,),
  );
  @override
  _UssdPageState createState() => _UssdPageState();
}

class _UssdPageState extends State<UssdPage> with AddMessText{
  List? lt=[];
  USSD_COMMON? ussd;
  void getInf()async{
   ussd=HiveDB.loadUssdInfo();
   ussd?.list.forEach((i){
     if(widget.indexPage==0){
       if(i.operator==2){
         lt?.add(InternetPackages(mb:"${i.ussdCode.toString()}",about: "${i.name.toString()}",desc: "${i.ussdCode.toString()}",));
       }
     }else if(widget.indexPage==1){
       if(i.operator==1){
         lt?.add(InternetPackages(mb:"${i.ussdCode.toString()}",about: "${i.name.toString()}",desc: "${i.ussdCode.toString()}",));
       }
     }else if(widget.indexPage==2){
       if(i.operator==3){
         lt?.add(InternetPackages(mb:"${i.ussdCode.toString()}",about: "${i.name.toString()}",desc: "${i.ussdCode.toString()}",));
       }
     }else if(widget.indexPage==3){
       if(i.operator==4){
         lt?.add(InternetPackages(mb:"${i.ussdCode.toString()}",about: "${i.name.toString()}",desc: "${i.ussdCode.toString()}",));
       }
     }
   });
     if(widget.indexPage==4){
      lt?.addAll([
           InternetPackages(mb:"9*1",about: "JORIY BALANS HAQIDA MA`LUMOT(BEPUL)",desc: "9*1",),
           InternetPackages(mb:"9*4",about: "OXIRGI TO`LOV NARXI VA KUNI HAQIDA MA`LUMOT",desc: "9*1",),
           InternetPackages(mb:"9*7",about: "JORIY TARIF REJASI HAQIDA MA`LUMOT(BEPUL)",desc: "9*7",),
      ]);
      }
   print(lt?.first.mb);
  }
  @override
  void initState(){
    super.initState();
    getInf();
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Consumer<UssdProvider>(
      builder: (context,value,child)=>Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title:Text('USSD Kodlar'),
            elevation: 0.0,
            bottomOpacity: 0.0,
            backgroundColor: widget.col,
          ),
          body:Builder(
            builder: (context)=>SafeArea(
                child:Container(
                    padding: EdgeInsets.all(5),
                    width: size.width,
                    // height: double.infinity,
                    child:ListView.builder(
                        itemCount: lt!.length,
                        itemBuilder:(context,index)=>Dismissible(
                          background:Center(child: Text("Axi",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),
                          key:ValueKey("in::$index _${lt![index].mb}"),
                          onDismissed: (direction){
                          value.removeInd(lt,index);
                        // ignore: deprecated_member_use
                          Scaffold.of(context).showSnackBar(
                          SnackBar(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top:Radius.circular(20)),
                            ),
                            backgroundColor: Colors.black,
                            content:Text('${index+1}-item deleted'),
                          ),
                        );
                      },
                        child: GestureDetector(child:myColumnWid(context,isUssd: true,package: lt![index],color:widget.col),onTap: ()=>showText(context,isUssd: true,package: lt![index],otherButton: 'Aktivlashtirish',),),
                    ))
                )
            ),
          )
      ),
    );
  }
}
