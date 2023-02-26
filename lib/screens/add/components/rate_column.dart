import 'package:flutter/material.dart';

import '../../components/rating_list_tile.dart';

class RateColumn extends StatelessWidget {
  const RateColumn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatingListTile(
          disable: false,
          text: "Food",
          // rate: 3,
        ),
        RatingListTile(
          disable: false,
          text: "Staying",
          // rate: 3,
        ),
        RatingListTile(
          disable: false,
          text: "Activities",
          // rate: 3,
        ),
        RatingListTile(
          disable: false,
          text: "Transportation",
          // rate: 3,
        ),
        RatingListTile(
          disable: false,
          text: "Nature",
          // rate: 3,
        ),
        RatingListTile(
          disable: false,
          text: "Pricing",
          // rate: 3,
        ),
      ],
    );
  }
}
