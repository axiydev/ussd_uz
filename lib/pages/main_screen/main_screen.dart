import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:ussd_uz/constants/constant.dart';
import 'package:ussd_uz/pages/drawer_page/drawer_screen.dart';
import 'package:ussd_uz/pages/five_page/five_screen.dart';
import 'package:ussd_uz/pages/fourth_page/fourth_screen.dart';
import 'package:ussd_uz/pages/home_screen/home_screen.dart';
import 'package:ussd_uz/pages/internet_paketlar/internet_page.dart';
import 'package:ussd_uz/pages/main_screen/main_provider.dart';
import 'package:ussd_uz/pages/second_screen/second_screen.dart';
import 'package:ussd_uz/pages/third_screen/third_screen.dart';
class MainScreen extends StatefulWidget {
  static const String id='main_screen';
  static Widget screen()=>ChangeNotifierProvider(create:(context)=>MainProvider(),child: MainScreen(),);
  @override
  _MainScreenState createState() => _MainScreenState();
}
enum MakeColor{UZMOBILE,MOBIUZ}
class _MainScreenState extends State<MainScreen> with AddMess{
  PageController? controller;
  int currentIndex=0;
  @override
  void initState(){
    super.initState();
    controller=PageController();
  }
  @override
  Widget build(BuildContext context) {
    final mod=Provider.of<MainProvider>(context);
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar:AppBar(
          leading: Builder(
              builder:(context)=>IconButton(
                icon:FaIcon(FontAwesomeIcons.bars),
                onPressed: ()=>Scaffold.of(context).openDrawer(),
              )
          ),
          backgroundColor:mod.currentColor,
          elevation: 0.0,
          bottomOpacity: 0.0,
          actions:[
            InkWell(
              child: Center(
                child: FaIcon(FontAwesomeIcons.userCircle,size: 24,),
              ),
              onTap: (){},
            ),
            SizedBox(width: 10,),
            InkWell(
              child: Center(
                child: FaIcon(FontAwesomeIcons.creditCard,size: 23.5,),
              ),
              onTap: ()=>showDial(context),
            ),
            SizedBox(width: 10,),
            InkWell(
              child: Center(
                child: FaIcon(FontAwesomeIcons.filter,size: 23.5,),
              ),
              onTap: (){},
            ),
            SizedBox(width: 12,),
            InkWell(
              child: Center(
                child: FaIcon(FontAwesomeIcons.shareAlt,size: 23.5,),
              ),
              onTap: ()=>shareInfo(context, 'Axiprogrammer@gmail.com'),
            ),
            SizedBox(width: 12,),
            InkWell(
              child: Center(
                child: FaIcon(FontAwesomeIcons.paperPlane,size: 23.5,),
              ),
              onTap: ()=>shareInfo(context,'Telegram guruh'),
            ),
            SizedBox(width: 12,),
            InkWell(
              child: Center(
                child: FaIcon(FontAwesomeIcons.bell,size: 23.5,),
              ),
              onTap: (){},
            ),
            SizedBox(width: 10,),
          ],
        ),
      backgroundColor: Colors.white,
      drawer:Drawer(
        child: DrawerScreen.screen(),
      ),
      body:Consumer<MainProvider>(
        builder: (context,value,child)=>Stack(
          children: [
            PageView(
              controller: controller,
              onPageChanged: (index){
                value.getIndex(index);
                value.setAppBarColor();
                print(value.indexInfo);
              },
              children: [
                HomeScreen.screen(),
                SecondScreen.screen(),
                ThirdScreen.screen(),
                FourthScreen.screen(),
                FiveScreen.screen(),
              ],
            ),
            Positioned(
              bottom: 0.0,
              child:GestureDetector(
                child: ClipPath(
                  clipper:MainClipper(),
                  child: Container(
                    height:size.height*0.74,
                    width:size.width,
                    color: Colors.white,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: size.width*0.34,left: size.width*0.1,right: size.width*0.1),
                      crossAxisCount:2,
                      mainAxisSpacing: size.width*0.025,
                      crossAxisSpacing: size.width*0.08,
                      children: [
                        //#internet paket
                        InkWell(child: _myCardWidgets(context,size: size,icon: FontAwesomeIcons.globe,text:'Internet paketlar'),onTap:()=>Navigator.pushNamed(context,InternetPage.id),),
                        //#ussd kodlar
                        _myCardWidgets(context,size: size,icon: FontAwesomeIcons.commentAlt,text: 'USSD kodlar'),
                        //#tarif rejalari
                        _myCardWidgets(context,size: size,icon: FontAwesomeIcons.simCard,text: 'Tarif rejalari'),
                        //#xizmatlar
                        _myCardWidgets(context,size: size,icon: FontAwesomeIcons.atom,text:'Xizmatlar'),
                        //#daqiqa toplamlari
                        _myCardWidgets(context,size: size,icon: FontAwesomeIcons.clock,text:'Daqiqa to`plamlari'),
                        //#sms to`plamlar
                        _myCardWidgets(context,size: size,icon: FontAwesomeIcons.envelopeOpen,text: "SMS to`plamlar"),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top:size.width*0.15,
              left: size.width*0.025,
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.caretLeft,size: size.width*0.1,color: mod.currentColInfo,),
                onPressed: (){
                  value.decrement();
                  controller?.animateToPage(value.indexInfo,duration: Duration(milliseconds: 250),curve: Curves.easeIn);
                },
              ),
            ),
            Positioned(
              top:size.width*0.15,
              right: size.width*0.025,
              child:IconButton(
                icon:FaIcon(FontAwesomeIcons.caretRight,size: size.width*0.1,color: mod.currentColInfo,),
                onPressed: (){
                   value.increment();
                   controller?.animateToPage(value.indexInfo,duration: Duration(milliseconds:300),curve: Curves.easeIn);
                },
              ),
            ),
            Positioned(
              top: size.width/3.7,
              child:Container(
                width:size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: indicatorBuilder(context,currentIndex),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _myBottomNav(context),
    );
  }
  void shareInfo(BuildContext context,String? text){
    final String str=text.toString();
    Share.share(
      str,
      subject: "$str",
    );
  }
}
Widget _myBottomNav(BuildContext context,){
  final Size size=MediaQuery.of(context).size;
  return Consumer<MainProvider>(
    builder: (context,value,child)=>Container(
      color: Colors.white,
      child: ClipPath(
        clipper:MyClipper(),
        child: Container(
            width:size.width,
            height: size.width*0.23,
            color: value.currentColInfo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Transform.translate(
                    offset: Offset(0,size.width*0.035),
                    child: Container(
                      height: size.width*0.11,
                      width: size.width*0.11,
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.headphonesAlt,color: Colors.white,),
                      ),
                    ),
                  ),
                  onTap: (){},
                ),
                SizedBox(width: size.width*0.04,),
                InkWell(
                  child: Transform.translate(
                    offset:Offset(0,size.width*0.02),
                    child: Container(
                      height: size.width*0.11,
                      width: size.width*0.11,
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.globe,color: Colors.white,),
                      ),
                    ),
                  ),
                  onTap: (){},
                ),
                SizedBox(width: size.width*0.04,),
                InkWell(
                  child:  Container(
                    margin: EdgeInsets.only(top:size.width*0.02),
                    height: size.width*0.145,
                    width: size.width*0.145,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(Icons.home,size: size.width*0.114,color:value.currentColInfo,),
                    ),
                  ),
                  onTap: (){},
                ),
                SizedBox(width: size.width*0.04,),
                InkWell(
                  child: Transform.translate(
                    offset:Offset(0,size.width*0.02),
                    child: Container(
                      height: size.width*0.11,
                      width: size.width*0.11,
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.wallet,color: Colors.white,),
                      ),
                    ),
                  ),
                  onTap: (){},
                ),
                SizedBox(width: size.width*0.04,),
                InkWell(
                  child: Transform.translate(
                    offset:Offset(0,size.width*0.035),
                    child: Container(
                      height: size.width*0.11,
                      width: size.width*0.11,
                      child: Center(
                        child: FaIcon(FontAwesomeIcons.cog,color: Colors.white,),
                      ),
                    ),),
                  onTap: (){},
                ),
              ],
            )
        ),
      ),
    ),
  );
}

class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   Path path=new Path();
     path.moveTo(0,size.height*0.5);
     path.quadraticBezierTo(size.width/2,-size.height/3,size.width,size.height*0.5);
     path.lineTo(size.width,size.height);
     path.lineTo(0,size.height);
     path.close();
   return path;
  }
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper)=>false;
}
class MainClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
   Path path=new Path();
   path.quadraticBezierTo(size.width*0.02,size.width*0.03, size.width*0.1,size.width*0.05);
   // path.quadraticBezierTo(size.width/2,size.height*0.35,size.width-size.width*0.1,size.width*0.05);
   path.cubicTo(size.width*0.25,size.height*0.25,size.width-size.width*0.25,size.height*0.25,size.width-size.width*0.1, size.width*0.05);
   path.quadraticBezierTo(size.width-size.width*0.02, size.width*0.03,size.width,0);
   path.lineTo(size.width,size.height);
   path.lineTo(0, size.height);
   path.close();
   return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) =>false;
}

Widget _myCardWidgets(BuildContext context,{required Size size,required icon,required String text})=>Card(
  child: Consumer<MainProvider>(
    builder: (context,value,child)=>Container(
        height:size.width*0.4,
        width: size.width*0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width*0.04),
          color: Colors.white,
          border: Border.all(color: Colors.grey,width: 0.1),
          boxShadow: [
            BoxShadow(offset: Offset(0,3),blurRadius: 3,color: Colors.grey),
          ],
        ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FaIcon(icon,color: value.currentColInfo,size:size.width*0.1,),
            SizedBox(height:size.width*0.04,),
            Text(text,textAlign:TextAlign.center,style:TextStyle(color: value.currentColInfo,fontSize:size.width*0.035,fontWeight: FontWeight.w600)),
          ],
        )
    ),
  ),
);
List<Widget> indicatorBuilder(BuildContext context,int index){
  final mod=Provider.of<MainProvider>(context);
  List<Widget> indicator1=<Widget>[];
  for(int i=0;i<=4;i++){
    if(mod.indexInfo==i){
      indicator1.add(indicator(context,isActive: true));
    }else{
      indicator1.add(indicator(context,isActive: false));
    }
  }
  return indicator1;
}
Widget indicator(BuildContext context,{isActive=false}){
  final Size size=MediaQuery.of(context).size;
  return AnimatedContainer(
    duration: Duration(milliseconds: 250),
    height:size.width*0.035,
    width:isActive?size.width*0.05:size.width*0.035,
    margin: EdgeInsets.only(left:10),
    decoration: BoxDecoration(
      color:isActive?Colors.white:Colors.grey,
      borderRadius: BorderRadius.circular(size.width*0.035/2),
    ),
  );
}

mixin AddMess{
 showDial(BuildContext context){
   showDialog(
       context: context,
       builder:(context)=>SimpleDialog(
         title: Text('To`lov usullari'),
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20),
         ),
         children: [
           ListTile(
             isThreeLine: false,
             title: Text('Click',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600)),
             trailing: Image.asset('assets/icons/click.png',fit: BoxFit.cover,),
             onTap: (){
               Share.share('Click',subject: 'Click');
             },
           ),

           Divider(
             thickness: 3,
             color: Colors.grey,
             indent: 20,
             endIndent: 20,
           ),
           ListTile(
             isThreeLine: false,
             title: Text('Payme',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w600),),
             trailing: Image.asset('assets/icons/payme.png',fit: BoxFit.cover,),
             onTap:(){
               Share.share('Payme',subject: 'Payme');

             }
           ),
           TextButton(
             onPressed: ()=>Navigator.of(context).pop(),
             child:Text('orqaga',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600)),
           ),
         ],
   ),
   );
 }
}