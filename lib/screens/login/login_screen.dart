import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:travel_tog/consts.dart';
import 'package:travel_tog/routes.dart';
import 'package:travel_tog/screens/home/home_screen.dart';
import 'package:travel_tog/services/auth_service.dart';
import 'package:travel_tog/screens/login/components/reset_password.dart';
import 'package:travel_tog/screens/login/components/sign_up.dart';
import 'package:travel_tog/size_config.dart';

import '../../services/service_locator.dart';
import 'components/headline_text.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? mailController;
  TextEditingController? passwordController;
  final authService = getIt.get<AuthService>();

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    mailController?.dispose();
    passwordController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Image.asset(
                //   "assets/images/ttog.png",
                //   scale: 1.8,
                // ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AuthHeadlineText(
                        text: "Login",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: TextFormField(
                          controller: mailController,
                          decoration: InputDecoration(
                              hintText: "E-mail",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(196, 196, 196, 1))),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(196, 196, 196, 1)),
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(196, 196, 196, 1))),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(196, 196, 196, 1)),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, resetPasswordRouteName);
                          },
                          child: Text(
                            "Forgot Password?",
                            style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(248, 152, 128, 1),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: RoundedLoadingButton(
                          color: Color.fromRGBO(245, 127, 90, 1),
                          controller: RoundedLoadingButtonController(),
                          onPressed: () {
                            authService.signInWithEmailAndPassword(
                                mailController!.text, passwordController!.text);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      SignInButton(
                        Buttons.google,
                        onPressed: () async {
                          // await authService.signInWithGoogle();
                        },
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.3),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SignInButton(
                        Buttons.apple,
                        onPressed: () {},
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.3),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      SignInButton(
                        Buttons.facebookNew,
                        onPressed: () {},
                        shape: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.3),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("New to Travel Tog?"),
                          TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, signUpRouteName);
                            },
                            child: Text(
                              "Sign up",
                              style: GoogleFonts.montserrat(
                                  color: Color.fromRGBO(248, 152, 128, 1),
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
