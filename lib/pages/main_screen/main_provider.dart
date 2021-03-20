import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ussd_uz/constants/constant.dart';

class MainProvider extends ChangeNotifier{
  int indeX=0;
  Color currentColor=firstPageColor;
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
        this.currentColor=firstPageColor;break;
      case 1:
        this.currentColor=secondPageColor;break;
      case 2:
        this.currentColor=thirdPageColor;break;
      case 3:
        this.currentColor=fourthPageColor;break;
      case 4:
        this.currentColor=fivePageColor;break;
    }
    notifyListeners();
  }
  Color get currentColInfo=>this.currentColor;
  int get indexInfo=>this.indeX;
}