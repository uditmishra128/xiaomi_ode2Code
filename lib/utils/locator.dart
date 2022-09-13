import 'package:get_it/get_it.dart';
import 'package:xiomi_ode_to_code/services/auth.dart';
import 'package:xiomi_ode_to_code/services/item_services.dart';

GetIt locator = GetIt.I;
void setUpSingleton() async {
  locator.registerLazySingleton<AuthService>(() => AuthService());
  locator.registerLazySingleton<ItemServices>(() => ItemServices());
}

AuthService get authServ => GetIt.I<AuthService>();
ItemServices get itemServ => GetIt.I<ItemServices>();
