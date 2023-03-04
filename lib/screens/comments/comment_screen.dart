import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:travel_tog/screens/comments/components/comment.dart';

class CommentScreen extends StatelessWidget {
  const CommentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  backgroundColor: Colors.grey.shade400,
                  barRadius: const Radius.circular(20),
                  width: 100,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Text("Comments",
                    style: GoogleFonts.montserrat(
                        fontSize: 16, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
          Container(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Comment();
                  })),
          Card(
            margin: EdgeInsetsDirectional.all(0),
            color: Colors.transparent,
            elevation: 0,
            child: ListTile(
              horizontalTitleGap: 0,
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              leading: CircleAvatar(
                radius: 15,
                foregroundImage: AssetImage("assets/images/ca.png"),
              ),
              title: SizedBox(
                height: 40,
                child: TextField(
                  clipBehavior: Clip.antiAlias,
                  decoration: InputDecoration(
                      hintText: "Describe your idea...",
                      hintStyle: TextStyle(fontSize: 13),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(173, 173, 173, 100)),
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(15)),
                      border: OutlineInputBorder(
                          gapPadding: 0,
                          borderRadius: BorderRadius.circular(15))),
                ),
              ),
              trailing: Transform.rotate(
                  angle: 5.5,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.send_rounded))),
            ),
          )
        ],
      ),
    );
  }
}
