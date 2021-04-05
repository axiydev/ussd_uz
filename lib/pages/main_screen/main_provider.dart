import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ussd_uz/constants/constant.dart';

class MainProvider with ChangeNotifier{
  int indeX=0;
  Color currentColor=firstPageColor;
  String currentLogo=firstPageLogo;
  String currentMotiv=firstPageMotiv;
  String  internetTextMain=internetText;
  String  ussdKodlarMain=ussdKodlar;
  String  tarifRejalariMain=tarifRejalari;
  String  xizmatlarMain=xizmatlar;
  String  daqiqaToplamlarMain=daqiqaToplamalr;
  String  smsToplamlarMain=smsToplamlar;
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
        this.daqiqaToplamlarMain=daqiqaToplamalr;
        break;
      case 1:
        this.currentColor=secondPageColor;
        this.currentLogo=secondPageLogo;
        this.currentMotiv=secondPageMotiv;
        this.daqiqaToplamlarMain=daqiqaToplamalr;
        break;
      case 2:
        this.currentColor=thirdPageColor;
        this.currentLogo=thirdPageLogo;
        this.currentMotiv=thirdPageMotiv;
        this.daqiqaToplamlarMain=daqiqaToplamalr;
        break;
      case 3:
        this.currentColor=fourthPageColor;
        this.currentLogo=fourPageLogo;
        this.currentMotiv=fourPageMotiv;
        this.daqiqaToplamlarMain=daqiqaToplamalr;
        break;
      case 4:
        this.currentColor=fivePageColor;
        this.currentLogo=fivePageLogo;
        this.currentMotiv=fivePageMotiv;
        this.daqiqaToplamlarMain="Qo`shimcha ma`lumot";
        break;
    }
    notifyListeners();
  }
  String get getCurrentLogo=>this.currentLogo;
  String get getCurrentMotiv=>this.currentMotiv;
  Color get currentColInfo=>this.currentColor;
  int get indexInfo=>this.indeX;
}