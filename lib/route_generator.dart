import 'package:flutter/material.dart';
import 'package:team_project_1/screens/add/add_screen.dart';
import 'package:team_project_1/screens/home/home_screen.dart';

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
