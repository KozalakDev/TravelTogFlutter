import 'package:flutter/material.dart';
import 'package:team_project_1/routes.dart';
import 'screens/home/home_screen.dart';

void main() {
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
        home: HomeScreen());
  }
}
