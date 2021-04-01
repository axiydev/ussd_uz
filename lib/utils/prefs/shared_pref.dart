import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ussd_uz/models/internet_screen_model.dart';

class Prefs{

  static Future<bool?> saveInfo(ComInter obiCom)async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    String networkInfo=jsonEncode(obiCom.toJson());
    return prefs.setString('networkInfo',networkInfo.toString());
  }

  static Future<ComInter?> getInterInfo()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    ComInter info= ComInter.fromJson(prefs.getString('networkInfo') as Map<String,dynamic>);
    return info;
  }

  static Future<bool?> removeInfoInter()async{
    SharedPreferences prefs=await SharedPreferences.getInstance();
    return prefs.remove('networkInfo');
  }
}