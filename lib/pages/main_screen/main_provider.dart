import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ussd_uz/constants/constant.dart';

class MainProvider with ChangeNotifier{
  int indeX=0;
  Color currentColor=firstPageColor;
  String currentLogo=firstPageLogo;
  String currentMotiv=firstPageMotiv;
  void increment(){
    indeX++;
    notifyListeners();
  }
  void decrement(){
    indeX--;
    notifyListeners();
  }
  void getIndex(int index){
    indeX=index;
    notifyListeners();
  }
  void setAppBarColor(){
    switch(indeX){
      case 0:
        this.currentColor=firstPageColor;
        this.currentLogo=firstPageLogo;
        this.currentMotiv=firstPageMotiv;
        break;
      case 1:
        this.currentColor=secondPageColor;
        this.currentLogo=secondPageLogo;
        this.currentMotiv=secondPageMotiv;
        break;
      case 2:
        this.currentColor=thirdPageColor;
        this.currentLogo=thirdPageLogo;
        this.currentMotiv=thirdPageMotiv;
        break;
      case 3:
        this.currentColor=fourthPageColor;
        this.currentLogo=fourPageLogo;
        this.currentMotiv=fourPageMotiv;
        break;
      case 4:
        this.currentColor=fivePageColor;
        this.currentLogo=fivePageLogo;
        this.currentMotiv=fivePageMotiv;
        break;
    }
    notifyListeners();
  }
  String get getCurrentLogo=>this.currentLogo;
  String get getCurrentMotiv=>this.currentMotiv;
  Color get currentColInfo=>this.currentColor;
  int get indexInfo=>this.indeX;
}