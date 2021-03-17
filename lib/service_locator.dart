import 'package:get_it/get_it.dart';
import 'package:shop/services/navigation_service.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}