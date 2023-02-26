import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Comment extends StatelessWidget {
  const Comment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              foregroundImage: AssetImage("assets/images/ca.png"),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "Kristin Kadir",
                          style: GoogleFonts.lato(
                              color: Colors.black, fontSize: 15)),
                      TextSpan(text: "/t"),
                      TextSpan(
                          text: "@kristinKadir",
                          style: GoogleFonts.lato(
                              color: Color.fromRGBO(163, 163, 163, 100),
                              fontSize: 15))
                    ]),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "This is 💯 one hundred percent the best lip mask duo ever !!!",
                      overflow: TextOverflow.ellipsis,
                      style:
                          GoogleFonts.lato(color: Colors.black, fontSize: 12),
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
