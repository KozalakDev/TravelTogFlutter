import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:team_project_1/screens/home/home_screen.dart';
import 'package:team_project_1/screens/login/components/reset_password.dart';
import 'package:team_project_1/screens/login/components/sign_up.dart';

class LoginScreen extends StatelessWidget {
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
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
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
                      onPressed: () {},
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
