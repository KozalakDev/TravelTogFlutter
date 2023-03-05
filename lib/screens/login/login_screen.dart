import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:travel_tog/screens/home/home_screen.dart';
import 'package:travel_tog/services/auth_service.dart';
import 'package:travel_tog/screens/login/components/reset_password.dart';
import 'package:travel_tog/screens/login/components/sign_up.dart';
import 'package:travel_tog/size_config.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? mailController;
  TextEditingController? passwordController;
  final authService =
      AuthService(); //TODO: use getit if u need to use it outsie this file

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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromRGBO(250, 250, 250, 1),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/ttog.png",
                scale: 1.8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Sign In",
                            style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(245, 127, 90, 1),
                                fontSize: 40)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: TextFormField(
                        controller: mailController,
                        decoration: InputDecoration(
                            hintText: "E-mail",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(196, 196, 196, 1))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(196, 196, 196, 1)),
                                borderRadius: BorderRadius.circular(15))),
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Password",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(196, 196, 196, 1))),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(196, 196, 196, 1)),
                              borderRadius: BorderRadius.circular(15))),
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
                          authService.registerWithEmailAndPassword(
                              mailController!.text, passwordController!.text);
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Forgot Password ?"),
                        TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ResetPassword();
                            }));
                          },
                          child: Text(
                            "Reset Password",
                            style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(248, 152, 128, 1),
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                    SignInButton(
                      Buttons.google,
                      onPressed: () async {
                        await authService.signInWithGoogle();
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
                        Text("You didn't"),
                        TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SignUp();
                            }));
                          },
                          child: Text(
                            "sign up ?",
                            style: GoogleFonts.montserrat(
                                color: Color.fromRGBO(248, 152, 128, 1),
                                fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
