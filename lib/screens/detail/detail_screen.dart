import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:team_project_1/screens/post/components/image_slider.dart';
import 'package:team_project_1/screens/components/rating_list_tile.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({super.key});

  final Map<String, double> ratingsMap = {
    'Food': 4.0,
    'Staying': 8.0,
    'Activites': 6.0,
    'Transportation': 9.0,
    'Nature': 8.0,
    'Pricing': 5.0
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          color: Color.fromRGBO(0, 0, 0, 245)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearPercentIndicator(
                  backgroundColor: Colors.grey.shade400,
                  barRadius: const Radius.circular(20),
                  width: 100,
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              // child: CarouselSlider(),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        "Şavşat, Artvin - Türkiye",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Aliquam convallis vulputate eu luctus dignissim erat felis. Platea aliquet urna urna in feugiat mi amet consequat rhoncus. Facilisi interdum feugiat enim in semper. Ut sit eros vitae ornare commodo in urna nulla pretium. Eleifend vitae amet dignissim.",
                  style: GoogleFonts.montserrat(),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                  children: ratingsMap.entries.map((entry) {
                return RatingBarIndicator(
                  itemBuilder: (context, index) => Container(),
                  // text: entry.key,
                  // disable: false,
                  // rate: entry.value / 2,
                );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
