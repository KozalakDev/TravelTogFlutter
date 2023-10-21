import 'package:get_it/get_it.dart';
import 'package:travel_tog/services/auth_service.dart';
import 'package:travel_tog/services/auth_state_service.dart';
import 'package:travel_tog/services/db_service.dart';
import 'package:travel_tog/services/image_service.dart';

final getIt = GetIt.instance;
AuthStateService authStateService = AuthStateService();

void setup() {
  getIt.registerSingleton<AuthService>(AuthService(authStateService: authStateService));
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerSingleton<ImageService>(ImageService());
}
