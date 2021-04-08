import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/models/internet/internet_model.dart';
import 'package:ussd_uz/pages/tarif_rejalari/about_tarif/about_tarif_provider.dart';
import 'package:ussd_uz/utils/network/network_plus.dart';

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
            actions: [
              IconButton(
                onPressed: (){
                  Share.share(widget.internetPack.mb.toString(),subject: widget.internetPack.about.toString());
                },
                icon: Icon(Icons.share),
              ),
              IconButton(
                onPressed: (){},
                icon: Icon(Icons.info_outline),
              ),
            ],
          ),

          body:SafeArea(
            child:Container(
              width: size.width,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top:20),
                      width: size.width,
                          child: Container(
                            width: size.width,
                            alignment: Alignment.center,
                            child: Column(
                              children:[
                                 Hero(
                                 tag:"${widget.internetPack.mb}",
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
                                         child:FadeInImage(
                                           image: NetworkImage('http://greatcentralasia1.uz/${widget.internetPack.img}'),
                                           placeholder: AssetImage('assets/icons/splash.jpg'),
                                           fit: BoxFit.cover,
                                         )

                                       ),
                                     ),
                                 ),
                                Text("${widget.internetPack.mb}",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600,color: widget.color,fontSize: 20),),
                              ],
                            ),
                          ),
                        ),
                    SizedBox(height: 15,),
                    Container(
                      width:size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                      child: Text(widget.internetPack.desc.toString(),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.grey),),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      height: size.width*0.14,
                      padding:EdgeInsets.symmetric(horizontal: size.width*0.13),
                      child:Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:secondPageColor,
                        ),
                        // ignore: deprecated_member_use
                        child: FlatButton(
                          onPressed: (){},
                          child: Text("Tarifni O`zgartirish",style:TextStyle(color: Colors.white,fontSize: 18)),
                        ),
                      )
                    ),
                    SizedBox(height: 15,),
                    Divider(
                      thickness: 3,
                      color: Colors.grey,
                      indent: size.width*0.05,
                      endIndent: size.width*0.05,
                    ),
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
