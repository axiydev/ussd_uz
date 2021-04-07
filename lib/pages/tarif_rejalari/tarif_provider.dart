import 'package:flutter/cupertino.dart';
import 'package:ussd_uz/constants/constant.dart';

class TarifProvider with ChangeNotifier{
  int currentIn=0;
  Color currentColorInternet=firstPageColor;
  String desc="tariflar bo`limi";
  void getEq(int index,String str){
    currentIn=index;
    desc=str;
    notifyListeners();
  }
  String get getInfoStr=>this.desc;
  int get getIn=>this.currentIn;
  Color get getColorInternet=>this.currentColorInternet;
}