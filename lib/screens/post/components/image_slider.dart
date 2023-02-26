import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_project_1/size_config.dart';

class ImageSlider extends StatelessWidget {
  ImageSlider({
    super.key,
    this.enlargeCenter,
    this.vpf,
    required this.carouselController,
  });

  final bool? enlargeCenter;
  final double? vpf;
  CarouselController carouselController;

  Function? nextPage() {
    carouselController.nextPage();
  }

  Function? previousPage() {
    carouselController.previousPage();
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      items: [1, 2, 3, 4].map((e) {
        return Builder(
          builder: (context) {
            return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset(
                "assets/images/$e.png",
                fit: BoxFit.cover,
                width: SizeConfig.screenWidth! * 3.5 / 5 - 10,
              ),
              // filterQuality: FilterQuality.high,
            );
          },
        );
      }).toList(),
      options: CarouselOptions(
        // clipBehavior: Clip.hardEdge,
        viewportFraction: this.vpf ?? 1,
        aspectRatio: 4 / 3,
        // autoPlayCurve: Curves.easeOutQuart,
        // enlargeFactor: 0.3,
        enlargeCenterPage: enlargeCenter,
        // pauseAutoPlayInFiniteScroll: false,
        // autoPlay: true,
      ),
    );
  }
}
