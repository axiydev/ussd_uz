import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ussd_uz/pages/language_page/language_provider.dart';
class LanguageScreen extends StatefulWidget {
  static const String id='language_screen';
  static Widget screen()=>ChangeNotifierProvider(
    create:(context)=>LanguageProvider(),
    child: LanguageScreen(),
  );
  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
  final Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child:Container(
          height:double.infinity,
          width: size.width,
          decoration: BoxDecoration(
            image:DecorationImage(
              image:AssetImage('assets/icons/bg_sign.jpg'),
              fit: BoxFit.cover,
            )
          ),
        ),
      ),
    );
  }
}
