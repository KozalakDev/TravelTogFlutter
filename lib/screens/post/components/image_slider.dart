import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_project_1/size_config.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3, 4].map((e) {
        return Builder(
          builder: (context) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                "assets/images/$e.png",
                fit: BoxFit.fill,
                width: SizeConfig.screenWidth! * 3 / 5,
              ),
              // filterQuality: FilterQuality.high,
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        // clipBehavior: Clip.hardEdge,
        viewportFraction: 1,
        aspectRatio: 4 / 3,
        // autoPlayCurve: Curves.easeOutQuart,
        // enlargeFactor: 0.3,
        // enlargeCenterPage: true,
        // pauseAutoPlayInFiniteScroll: false,
        // autoPlay: true,
      ),
    );
  }
}
