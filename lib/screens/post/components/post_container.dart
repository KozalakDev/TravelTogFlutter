import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_project_1/screens/post/components/image_slider.dart';
import 'package:team_project_1/screens/detail/detail_screen.dart';
import 'package:team_project_1/consts.dart' as constants;
import 'package:team_project_1/size_config.dart';

import 'interractions_row.dart';
import 'linear_rate_bar.dart';

class PostContainer extends StatelessWidget {
  PostContainer({super.key});

  final CarouselController carouselController = CarouselController();

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
              return DetailScreen();
            });
      },
      child: Container(
        // padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 36,
                    child: CircleAvatar(
                      radius: 20,
                      child: Image.asset("assets/images/ca.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("CoderNomad", style: constants.UserNameTextStyle),
                  Spacer(),
                  PopupMenuButton(
                    itemBuilder: (context) => <PopupMenuEntry>[
                      const PopupMenuItem<String>(
                        value: 'Edit',
                        child: Text('Edit'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'Delete',
                        child: Text(
                          'Delete',
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenWidth! * (3.5 / 5) * 3 / 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: SizeConfig.screenWidth! * 1.5 / 5 - 15,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.location_on_outlined),
                                    Expanded(
                                      child: Text(
                                        "Şavşat, Artvin",
                                        style: constants.LocationTextStyle,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Column(
                                  children: const [
                                    LinearRateBar(
                                      icon: Icons.fastfood_rounded,
                                      rate: 0.5,
                                    ),
                                    LinearRateBar(
                                      icon: Icons.hotel_rounded,
                                      rate: 0.8,
                                    ),
                                    LinearRateBar(
                                      icon: Icons.directions_walk,
                                      rate: 0.6,
                                    ),
                                    LinearRateBar(
                                      icon: Icons.emoji_transportation_rounded,
                                      rate: 0.8,
                                    ),
                                    LinearRateBar(
                                      icon: Icons.forest_rounded,
                                      rate: 0.8,
                                    ),
                                    LinearRateBar(
                                      icon: Icons.price_change_outlined,
                                      rate: 0.3,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                            width: SizeConfig.screenWidth! * 3.5 / 5 - 15,
                            // height: SizeConfig.screenHeight! / 4,
                            child: ImageSlider(
                              carouselController: carouselController,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: InterractionsRow(),
                  ),
                  const Divider()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
