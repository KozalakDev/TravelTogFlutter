import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:team_project_1/consts.dart';

class RatingListTile extends StatelessWidget {
  RatingListTile(
      {super.key,
      this.rate,
      required this.text,
      required this.disable,
      required this.changeRating});

  final String text;
  double? rate = 0;
  final bool disable;
  final Function(String, double) changeRating;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0, right: 20),
      child: ListTile(
        title: Text(
          text,
          style: GoogleFonts.montserrat(fontSize: 15),
        ),
        trailing: RatingBar(
          allowHalfRating: true,
          ignoreGestures: disable,
          glow: false,
          itemSize: 30,
          ratingWidget: RatingWidget(
              full: Icon(
                Icons.star,
                color: starColor,
              ),
              half: Icon(
                Icons.star_half,
                color: starColor,
              ),
              empty: Icon(
                Icons.star_border,
                color: starColor,
              )),
          onRatingUpdate: (value) {
            changeRating(text, value);
          },
        ),
      ),
    );
  }
}
