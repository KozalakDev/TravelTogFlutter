import 'package:flutter/material.dart';
import 'package:team_project_1/screens/components/image_slider.dart';
import 'package:team_project_1/screens/detail_screen.dart';
import 'package:team_project_1/consts.dart' as constants;
import 'package:team_project_1/size_config.dart';

import 'interractions_row.dart';
import 'linear_rate_bar.dart';

class PostContainer extends StatelessWidget {
  const PostContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            useSafeArea: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            builder: (context) {
              return const DetailScreen();
            });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Image.asset("assets/images/ca.png"),
                ),
                Text("CoderNomad", style: constants.UserNameTextStyle),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // width: SizeConfig.screenWidth! * 2 / 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.location_on_outlined),
                          Text(
                            "Şavşat, Artvin",
                            style: constants.LocationTextStyle,
                          ),
                        ],
                      ),
                      const LinearRateBar(
                        icon: Icons.fastfood_rounded,
                        rate: 0.5,
                      ),
                      const LinearRateBar(
                        icon: Icons.hotel_rounded,
                        rate: 0.8,
                      ),
                      const LinearRateBar(
                        icon: Icons.directions_walk,
                        rate: 0.6,
                      ),
                      const LinearRateBar(
                        icon: Icons.emoji_transportation_rounded,
                        rate: 0.8,
                      ),
                      const LinearRateBar(
                        icon: Icons.forest_rounded,
                        rate: 0.8,
                      ),
                      const LinearRateBar(
                        icon: Icons.price_change_outlined,
                        rate: 0.3,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                    width: SizeConfig.screenWidth! * 3 / 5,
                    height: SizeConfig.screenHeight! / 3.5,
                    child: const ImageSlider()),
              ],
            ),
            const InterractionsRow(),
            const Divider()
          ],
        ),
      ),
    );
  }
}
