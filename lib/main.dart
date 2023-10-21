import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_tog/routes.dart';
import 'package:travel_tog/services/auth_service.dart';
import 'package:travel_tog/services/auth_state_service.dart';
import 'package:travel_tog/services/service_locator.dart';

import 'screens/splash/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: authStateService,
      child: MaterialApp(
          routes: routes,
          title: 'Travel Tog',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: SplashScreen()),
    );
  }
}
