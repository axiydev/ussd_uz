import 'package:hive/hive.dart';
import 'package:ussd_uz/models/internet_screen_model.dart';

class HiveDB{
  static var box=Hive.box('hive_db');

  static storeInterInfo(ComInter objInt)async{
    await box.put('networkInfo',objInt.toJson());
  }

  static ComInter loadInterInfo(){
    var mp=box.get('networkInfo');
    return ComInter.fromJson(mp);
  }

  static removeInfo()async{
   await box.delete('networkInfo');
  }
}