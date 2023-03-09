import 'package:flutter/material.dart';
import 'package:travel_tog/routes.dart';
import 'package:travel_tog/screens/home/home_screen.dart';
import 'package:travel_tog/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_tog/services/auth_service.dart';
import 'package:travel_tog/services/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: routes,
        title: 'Travel Tog',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage());
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: getIt.get<AuthService>().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
