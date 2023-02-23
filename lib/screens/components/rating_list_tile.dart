import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingListTile extends StatelessWidget {
  RatingListTile(
      {super.key,
      required this.text,
      required this.rate,
      required this.disable,
      this.changeRating});

  final String text;
  double? rate = 0;
  final bool disable;
  final Function(double)? changeRating;

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
            ignoreGestures: disable,
            initialRating: rate ?? 0,
            itemSize: 30,
            ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                half: const Icon(Icons.star),
                empty: const Icon(
                  Icons.star,
                )),
            onRatingUpdate: changeRating ?? (_) {}),
      ),
    );
  }
}
