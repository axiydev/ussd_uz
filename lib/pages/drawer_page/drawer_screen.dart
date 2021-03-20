import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/pages/drawer_page/drawer_provider.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';

class DrawerScreen extends StatefulWidget {
  static final String id="drawer_screen";
  static Widget screen()=>ChangeNotifierProvider(
    create:(context)=>DrawerScreenModel(),
    child: DrawerScreen(),
  );
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> with AdditionalMessages{
 showMessagee()async{
    showDialog(context: context, builder:(context)=>AlertDialog(
      title: Text('Biz bilan aloqa'),
      content:Text('Email:axiprogrammer@gmail.com'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          child: Text('orqaga'),
          onPressed: (){},
        ),
        TextButton(
          child: Text('xat jo`natish'),
          onPressed: (){},
        ),
      ],
    )
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Consumer2<MainProvider,DrawerScreenModel>(
      builder: (context,valueMain,valueDrawer,child)=>Scaffold(
        backgroundColor: Colors.white,
        body:SafeArea(
                child: Container(
                  height: size.height,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: size.height*0.3,
                        width: double.infinity,
                        color: valueMain.currentColInfo,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('USSD Mobile',style: TextStyle(color: Colors.white,fontSize: size.width*0.05,fontWeight: FontWeight.w600),),
                            Divider(color: Colors.white,thickness: 3,indent: size.width*0.15,endIndent: size.width*0.15,),
                            SizedBox(height:size.width*0.03,),
                            Container(
                              height: size.width*0.145,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Image(
                                image:AssetImage('assets/icons/ums.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: size.width*0.02,),
                            Text('Ishonchli aloqa mobil operatori',style: TextStyle(color: Colors.white,fontSize:size.width*0.045,fontWeight: FontWeight.w600),),
                          ],
                        ),
                      ),
                      Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(left:size.width*0.05),
                          child: Column(
                            children: [
                              _customListTile(size: size, text:'Telegram kanal', icon:FontAwesomeIcons.telegram),
                              GestureDetector(child: _customListTile(size: size, text:'Biz bilan aloqa', icon:FontAwesomeIcons.idCardAlt,),onTap:()=>showMessage(context),),
                              _customListTile(size: size, text:'Tilni o`zgartirish', icon:FontAwesomeIcons.userCircle),
                              _customListTile(size: size, text:'Ulashish', icon:FontAwesomeIcons.shareAlt),
                              _customListTile(size: size, text:'Baholash', icon:FontAwesomeIcons.star),
                              InkWell(child: _customListTile(size: size, text:'Biz haqimizda', icon:FontAwesomeIcons.infoCircle),onTap: ()=>showDia(context),),
                              _customListTile(size: size, text:'Uzimeida ro`yxatdan o`tish', icon:FontAwesomeIcons.clipboardCheck),
                            ],
                          )
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
Widget _customListTile({required Size size,required String text, required icon,}){
     return ListTile(
        minVerticalPadding: size.width*0.02,
        minLeadingWidth:size.width*0.08,
        contentPadding: EdgeInsets.all(0),
        isThreeLine: false,
        leading: FaIcon(icon),
        title: Text(text,style:TextStyle(color: Colors.black,fontSize:size.width*0.043)),
  );
}

mixin AdditionalMessages{
   showMessage(BuildContext context)async{
    showDialog(context: context, builder:(context)=>AlertDialog(
      title: Text('Biz bilan aloqa'),
      content:Text('Email:axiprogrammer@gmail.com'),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: Colors.white,
      actions: [
        TextButton(
          child: Text('orqaga'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
        //Uri
        TextButton(
          child: Text('xat jo`natish'),
          onPressed: (){},
        ),
      ],
    )
    );
  }

  showDia(BuildContext context)async{
     showDialog(
       context: context,
       builder: (context)=>AlertDialog(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20),
         ),
         title: Text('About Us'),
         content: Text('Mazkur ilova Axmadjon Isaqov tomonidan ishlab chiqildi TUNE CONSULTING \u{1f3e0}',style: TextStyle(fontSize:16,fontWeight: FontWeight.w600,color: Colors.blue),),
         actions: [
           IconButton(
             icon: Icon(Icons.arrow_back_rounded),
             onPressed: ()=>Navigator.of(context).pop(),
             splashColor: Colors.redAccent,
           ),
         ],
       )
     );
  }
}