import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_tog/consts.dart';

class RatingsColumn extends StatelessWidget {
  const RatingsColumn({
    super.key,
    required this.ratingsMap,
  });

  final Map<String, double> ratingsMap;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: ratingsMap.entries.map((entry) {
      return ListTile(
        title: Text(
          entry.key,
          style: GoogleFonts.montserrat(fontSize: 15),
        ),
        trailing: RatingBarIndicator(
          rating: entry.value / 2,
          itemBuilder: (context, index) => Icon(
            Icons.star,
            color: starColor,
          ),
        ),
      );
    }).toList());
  }
}
