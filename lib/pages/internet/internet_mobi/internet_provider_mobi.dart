import 'package:flutter/cupertino.dart';
import 'package:ussd_uz/constants/constant.dart';

class InternetProviderMobi with ChangeNotifier{
  int currentIn=0;
  Color currentColorInternet=firstPageColor;
  void getEq(int index){
    currentIn=index;
    notifyListeners();
  }
  int get getIn=>this.currentIn;
  Color get getColorInternet=>this.currentColorInternet;
}