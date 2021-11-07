import 'package:app/services/charge_points/charge_points_service.dart';
import 'package:app/services/common/settings_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initServiceLocator() {
  getIt.registerLazySingleton<SettingsService>(() => SettingsService());
  getIt.registerLazySingleton<ChargePointsService>(() => ChargePointsService());
}
