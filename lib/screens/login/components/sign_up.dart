import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:travel_tog/routes.dart';
import 'package:travel_tog/screens/login/components/reset_password.dart';
import '../../../services/auth_service.dart';
import '../../../services/service_locator.dart';
import '../../home/home_screen.dart';
import 'headline_text.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController? mailController;
  TextEditingController? passwordController;
  TextEditingController? userNameController;
  final authService = getIt.get<AuthService>();

  @override
  void initState() {
    super.initState();
    mailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    mailController?.dispose();
    passwordController?.dispose();
    userNameController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      AuthHeadlineText(
                        text: "Register",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 5),
                        child: TextFormField(
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
                      SizedBox(
                        height: 10,
                      ),
                      //TODO: validate username
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Username",
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password Again",
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
                        height: 20,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Joined us before?"),
                          TextButton(
                            style: ButtonStyle(
                                overlayColor: MaterialStateProperty.all(
                                    Colors.transparent)),
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, loginRouteName);
                            },
                            child: Text(
                              "Login",
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
