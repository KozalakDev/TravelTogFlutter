import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_tog/screens/login/login_screen.dart';
import 'package:travel_tog/services/auth_state_service.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AuthState authState = context.watch<AuthStateService>().authState;
    print('authstate: $authState');
    if (authState == AuthState.unauthenticated) {
      return LoginScreen();
    } else if (authState == AuthState.authenticated) {
      return HomeScreen();
    } else {
      return Scaffold(body: Container());
    }
  }
}
