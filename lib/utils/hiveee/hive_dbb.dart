import 'package:hive/hive.dart';
import 'package:ussd_uz/models/internet/internet_screen_model.dart';
import 'package:ussd_uz/models/service/service_model.dart';
import 'package:ussd_uz/models/sms/sms_model.dart';
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

//#service
  static storeServiceInfo(ServiceMod objSer)async{
    await box.put('service',objSer.toJson());
  }

  static ServiceMod loadServiceInfo(){
    var mp=box.get('service');
    return ServiceMod.fromJson(mp);
  }

  static removeServiceInfo()async{
    await box.delete('service');
  }

//#serviceCategory
  static storeServiceCategoryInfo(ServiceModCategory objSer)async{
    await box.put('serviceCategory',objSer.toJson());
  }

  static ServiceModCategory loadServiceCategoryInfo(){
    var mp=box.get('serviceCategory');
    return ServiceModCategory.fromJson(mp);
  }

  static removeServiceCategoryInfo()async{
    await box.delete('serviceCategory');
  }

//#sms
  static storeSmsInfo(SmsMod objSms)async{
    await box.put('sms',objSms.toJson());
  }

  static SmsMod loadSmsInfo(){
    var mp=box.get('sms');
    return SmsMod.fromJson(mp);
  }

  static removeSmsInfo()async{
    await box.delete('sms');
  }

//#smsCategory
  static storeSmsCategoryInfo(SmsModCategory objSmsCategory)async{
    await box.put('smsCategory',objSmsCategory.toJson());
  }

  static SmsModCategory loadSmsCategoryInfo(){
    var mp=box.get('smsCategory');
    return SmsModCategory.fromJson(mp);
  }

  static removeSmsCategoryInfo()async{
    await box.delete('smsCategory');
  }
}