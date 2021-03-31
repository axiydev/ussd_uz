import 'package:get_it/get_it.dart';
import 'package:ussd_uz/utils/hiveee/hive_dbb.dart';

GetIt locator=GetIt.instance;
void locatorSetUp()async{
  locator.registerLazySingleton<HiveDB>(()=>HiveDB());
  locator.get<HiveDB>();
}