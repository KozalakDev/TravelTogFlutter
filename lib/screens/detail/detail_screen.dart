import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:team_project_1/screens/comments/components/comment.dart';
import 'package:team_project_1/screens/post/components/image_slider.dart';
import 'package:team_project_1/screens/components/rating_list_tile.dart';

import '../../size_config.dart';

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

  final CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
          color: Color.fromRGBO(255, 255, 255, 100)),
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
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                      width: SizeConfig.screenWidth! * 4.5 / 4 - 15,
                      height: SizeConfig.screenHeight! / 4,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.5),
                        child: ImageSlider(
                          carouselController: carouselController,
                          vpf: 0.73,
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CupertinoButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        carouselController.nextPage();
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_right_rounded,
                        size: 50,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: CupertinoButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {
                          carouselController.previousPage();
                        },
                        child: const Icon(
                          Icons.keyboard_arrow_left_rounded,
                          size: 50,
                          color: Colors.black54,
                        ),
                      )),
                ],
              ),
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
              padding: const EdgeInsets.only(top: 20, right: 15, left: 15),
              child: Row(
                children: [
                  Text("Ratings",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                  children: ratingsMap.entries.map((entry) {
                return RatingListTile(
                  text: entry.key,
                  disable: true,
                  rate: entry.value / 2,
                  changeRating: (String, double) {},
                );
              }).toList()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text("Comments",
                      style: GoogleFonts.montserrat(
                          fontSize: 16, fontWeight: FontWeight.w600)),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Column(
                children: [Comment(), Comment()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
