import 'package:get_it/get_it.dart';
import 'package:xiomi_ode_to_code/services/auth.dart';

GetIt locator = GetIt.I;
void setUpSingleton() async {
  locator.registerLazySingleton<AuthService>(() => AuthService());
}

AuthService get authServ => GetIt.I<AuthService>();
