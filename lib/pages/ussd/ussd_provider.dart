import 'package:flutter/cupertino.dart';

class UssdProvider with ChangeNotifier{

  void removeInd(List? lt,int index){
  lt?.removeAt(index);
  notifyListeners();
}

}