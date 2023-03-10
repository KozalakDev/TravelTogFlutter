import 'package:get_it/get_it.dart';
import 'package:travel_tog/services/auth_service.dart';
import 'package:travel_tog/services/db_service.dart';
import 'package:travel_tog/services/image_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AuthService>(AuthService());
  getIt.registerSingleton<DatabaseService>(DatabaseService());
  getIt.registerSingleton<ImageService>(ImageService());
}
