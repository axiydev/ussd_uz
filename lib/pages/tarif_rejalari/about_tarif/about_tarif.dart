import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/models/internet/internet_model.dart';
import 'package:ussd_uz/pages/tarif_rejalari/about_tarif/about_tarif_provider.dart';

class AboutTarifPage extends StatefulWidget {
  static const String id="about_tarif_page";
  late Color color;
  late String img;
  late InternetPackages internetPack;
  AboutTarifPage({required this.color,required this.img,required this.internetPack});
  static Widget screen(color,image,internet)=>ChangeNotifierProvider<AboutTarifProvider>(
    create:(context)=>AboutTarifProvider(),
    child: AboutTarifPage(color: color,img: image,internetPack: internet,),
  );
  @override
  _AboutTarifPageState createState() => _AboutTarifPageState();
}

class _AboutTarifPageState extends State<AboutTarifPage> {
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return Consumer<AboutTarifProvider>(
        builder: (context,value,child)=>Scaffold(
          appBar: AppBar(
            backgroundColor: widget.color,
            elevation: 0.0,
            bottomOpacity: 0.0,
            title: Text('Tarif'),
            centerTitle: false,
          ),
          body:SafeArea(
            child:Container(
              width: size.width,
              margin: EdgeInsets.only(top:20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                          child: Container(
                            width: size.width,
                            alignment: Alignment.center,
                            child: Column(
                              children:[
                                 Hero(
                                 tag:"${widget.internetPack.about}",
                                   child:Container(
                                       width: size.width*0.6,
                                       height: size.width*0.4,
                                       padding: EdgeInsets.all(2),
                                       decoration: BoxDecoration(
                                         border:Border.all(width: 3,color: Colors.deepOrange),
                                         borderRadius: BorderRadius.circular(20),
                                       ),
                                       child:ClipRRect(
                                         borderRadius: BorderRadius.circular(15),
                                         child:Image(
                                           image:AssetImage('assets/icons/splash.jpg'),
                                           fit: BoxFit.cover,
                                         ),

                                       ),
                                     ),
                                 ),
                                Text("${widget.internetPack.about}",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600,color: widget.color,fontSize: 20),),
                              ],
                            ),
                          ),
                        ),
                    SizedBox(height: 15,),
                    Container(
                      width:size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Text(widget.internetPack.desc.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
