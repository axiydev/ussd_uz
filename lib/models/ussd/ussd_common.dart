import 'package:ussd_uz/models/ussd/ussd_model.dart';

class USSD_COMMON{
  final List<USSD_UZ> list;
  USSD_COMMON.fromJson(Map<String,dynamic> json):
      this.list=List<USSD_UZ>.from(json['list'].map((i)=>USSD_UZ.fromJson(i)));
  Map<String,dynamic> toJson()=>{
    'list':List<dynamic>.from(this.list.map((i) =>i.toJson()))
  };
}