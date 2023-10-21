import 'package:flutter/material.dart';
import 'package:travel_tog/screens/add/add_screen.dart';
import 'package:travel_tog/screens/home/home_screen.dart';
import 'package:travel_tog/screens/login/components/reset_password.dart';
import 'package:travel_tog/screens/login/components/sign_up.dart';
import 'package:travel_tog/screens/login/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/add':
        return MaterialPageRoute(
          builder: (_) => const AddPostScreen(),
        );
        break;

      case '/pickImages':
        return MaterialPageRoute(
          builder: (_) => const AddPostScreen(),
        );
        break;
      case '/resetPassword':
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );
        break;

      case '/signUp':
        return MaterialPageRoute(
          builder: (_) => const SignUp(),
        );
        break;

      case '/login':
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
        break;

      default:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
    }
  }
}
