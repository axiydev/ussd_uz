import 'package:get_it/get_it.dart';
import 'package:ussd_uz/utils/hiveee/hive_dbb.dart';

GetIt locator=GetIt.instance;
void locatorSetUp(){
  locator.registerLazySingleton<HiveDB>(() =>HiveDB());
}