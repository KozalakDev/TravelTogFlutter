import 'package:flutter/material.dart';

enum AuthState { uninitialized, authenticated, unauthenticated }

class AuthStateService extends ChangeNotifier {
  AuthState _authState = AuthState.uninitialized;

  AuthState get authState => _authState;

  void setAtuhState(AuthState authState) {
    print(authState);
    _authState = authState;
    notifyListeners();
  }
}
