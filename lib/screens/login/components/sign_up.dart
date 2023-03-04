import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:team_project_1/screens/login/components/reset_password.dart';

import '../../home/home_screen.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            LinearPercentIndicator(
              backgroundColor: Colors.grey.shade400,
              barRadius: const Radius.circular(20),
              width: 100,
            ),
          ]),
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
    );
  }
}
