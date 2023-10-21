import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:travel_tog/routes.dart';
import 'package:travel_tog/services/auth_state_service.dart';

import '../main.dart';

class AuthService {
  final FlutterSecureStorage storage = FlutterSecureStorage();
  final Dio _dio = Dio();
  final AuthStateService authStateService;

  static String mainUrl = "https://reqres.in"; //TODO: replace these
  var loginUrl = '$mainUrl/api/login';
  var registerUrl = '$mainUrl/api/register';

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'token');
    if (value != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> persistToken(String token) async {
    await storage.write(key: 'token', value: token);
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'token');
    storage.deleteAll();
  }

  Future<void> initializeService() async {
    final bool value = await hasToken();
    if (value) {
      authStateService.setAtuhState(AuthState.authenticated);
    } else {
      authStateService.setAtuhState(AuthState.unauthenticated);
    }
  }

  AuthService({required this.authStateService}) {
    initializeService();
  }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      // var url = Uri.http('127.0.0.1:8080', 'api/v1/auth/authenticated');

      // var response = await http.post(url,
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Connection': 'keep-alive',
      //       'Transfer-Encoding': 'chunked'
      //     },
      //     body: json
      //         .encode({"email": "kadir2@test.com", "password": "12345678"}));

      Response response = await _dio.post(loginUrl,
          data: {"email": "eve.holt@reqres.in", "password": "cityslicka"});

      print('Response status: ${response.statusCode}');
      if (response.statusCode.toString().startsWith('20')) {
        print('Response body: ${response.data}');
        authStateService.setAtuhState(AuthState.authenticated);
        return response.data["token"];
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    // UserCredential result = await _firebaseAuth
    //     .createUserWithEmailAndPassword(email: email, password: password);
    // User? user = result.user;

    // return user;
    try {
      // var url = Uri.http('127.0.0.1:8080', 'api/v1/auth/register');

      // var response = await http.post(url,
      //     headers: {
      //       'Content-Type': 'application/json',
      //       'Connection': 'keep-alive',
      //       'Transfer-Encoding': 'chunked'
      //     },
      //     body: json.encode({
      //       "username": "kadir123",
      //       "email": "kadir2@test.com",
      //       "password": "12345678"
      //     }));

      Response response = await _dio.post(registerUrl,
          data: {"email": "eve.holt@reqres.in", "password": "pistol"});

      print('Response status: ${response.statusCode}');
      if (response.statusCode.toString().startsWith('20')) {
        print('Response body: ${response.data}');
        authStateService.setAtuhState(AuthState.authenticated);
        return response.data["token"];
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;

  //     // Create a new credential
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth?.accessToken,
  //       idToken: googleAuth?.idToken,
  //     );

  //     // Once signed in, return the UserCredential
  //     final UserCredential userCredential =
  //         await _firebaseAuth.signInWithCredential(credential);

  //     // DatabaseService(_firebaseAuth).updateUserData();

  //     return userCredential;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  Future<void> signOut() async {
    try {
      deleteToken();
      authStateService.setAtuhState(AuthState.unauthenticated);
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<void> sendPasswordResetEmail(String email) async {
  //   return _firebaseAuth.sendPasswordResetEmail(email: email);
  // }
}
