import 'package:flutter/material.dart';
import 'package:travel_tog/screens/add/add_screen.dart';
import 'package:travel_tog/screens/home/home_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/add':
        return MaterialPageRoute(
          builder: (_) => const AddPostScreen(),
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
    }
  }
}
