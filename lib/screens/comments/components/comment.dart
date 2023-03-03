import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Comment extends StatefulWidget {
  const Comment({
    super.key,
  });

  @override
  State<Comment> createState() => _CommentState();
}

bool isLiked = false;
int counter = 0;

class _CommentState extends State<Comment> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 15,
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
                  Column(
                    children: [
                      Text(
                        "This is 💯 one percent the best lip mask duo ever !",
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.lato(
                            color: Colors.black, fontSize: 12.4),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
          Stack(alignment: Alignment.center, children: [
            IconButton(
                visualDensity: VisualDensity.compact,
                onPressed: () {
                  setState(() {
                    isLiked = !isLiked;
                    if (isLiked) {
                      counter++;
                    } else {
                      counter--;
                    }

                    print(isLiked);
                  });
                },
                icon: isLiked
                    ? Icon(
                        Icons.favorite_rounded,
                        color: Colors.redAccent,
                      )
                    : Icon(
                        Icons.favorite_border_rounded,
                        color: Colors.black,
                      )),
            Text(counter.toString())
          ]),
        ],
      ),
    );
  }
}
