import 'package:flutter/cupertino.dart';
import 'package:ussd_uz/constants/constant.dart';

class DaqiqaProvider with ChangeNotifier{
  int currentIn=0;
  Color currentColorInternet=firstPageColor;
  String desc="Daqiqa to`plamlar bo`limi";
  void getEq(int index,String str){
    currentIn=index;
    desc=str;
    notifyListeners();
  }
  String get getInfoStr=>this.desc;
  int get getIn=>this.currentIn;
  Color get getColorInternet=>this.currentColorInternet;
}