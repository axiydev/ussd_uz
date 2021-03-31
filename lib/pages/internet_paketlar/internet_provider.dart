import 'package:flutter/cupertino.dart';
import 'package:ussd_uz/constants/constant.dart';

class InternetProvider with ChangeNotifier{
  int currentIn=0;
  Color currentColorInternet=firstPageColor;
  void getEq(int index){
    currentIn=index;
    notifyListeners();
  }
  void checkCol(int? ind){
    print(ind);
    switch(ind){
      case null:
      case 0:
        currentColorInternet=firstPageColor;
        break;
      case 1:
        currentColorInternet=secondPageColor;
        break;
      case 2:
        currentColorInternet=thirdPageColor;
        break;
      case 3:
        currentColorInternet=fourthPageColor;
        break;
      case 4:
        currentColorInternet=fivePageColor;
        break;
    }
    notifyListeners();
  }
  int get getIn=>this.currentIn;
  Color get getColorInternet=>this.currentColorInternet;
}