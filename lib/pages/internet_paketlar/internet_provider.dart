import 'package:flutter/cupertino.dart';

class InternetProvider with ChangeNotifier{
  int currentIn=0;
  void getEq(int index){
    currentIn=index;
    notifyListeners();
  }
  int get getIn=>this.currentIn;
}