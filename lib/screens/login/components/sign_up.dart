import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sign_in_button/sign_in_button.dart';

import '../../home/home_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign Up",
                              style: GoogleFonts.montserrat(
                                  color: Color.fromRGBO(245, 127, 90, 1),
                                  fontSize: 40)),
                        ],
                      ),
                    ),
                    TextFormField(
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
                    SizedBox(
                      height: 10,
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
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: "Password Again",
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
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: RoundedLoadingButton(
                        duration: Duration(seconds: 3),
                        color: Color.fromRGBO(245, 127, 90, 1),
                        controller: RoundedLoadingButtonController(),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeScreen();
                          }));
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 17,
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
