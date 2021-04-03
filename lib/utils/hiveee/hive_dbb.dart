import 'package:hive/hive.dart';
import 'package:ussd_uz/models/internet/internet_screen_model.dart';
import 'package:ussd_uz/models/ussd/ussd_common.dart';

class HiveDB{
  static var box=Hive.box('hive_db');
  //#internet uchun
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

//#ussd uchun
  static storeUssdInfo(USSD_COMMON objInt)async{
    await box.put('ussd',objInt.toJson());
  }

  static USSD_COMMON loadUssdInfo(){
    var mp=box.get('ussd');
    return USSD_COMMON.fromJson(mp);
  }

  static removeUssdInfo()async{
    await box.delete('ussd');
  }
}