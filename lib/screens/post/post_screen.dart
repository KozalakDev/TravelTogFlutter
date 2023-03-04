import 'package:flutter/material.dart';
import 'package:travel_tog/routes.dart';

import 'components/post_container.dart';

class PostPage extends StatelessWidget {
  const PostPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) {
            return PostContainer();
          },
        ),
        // CarouselSlider(
        //   options: CarouselOptions(height: 400.0),
        //   items: [1, 2, 3, 4, 5].map((i) {
        //     return Builder(
        //       builder: (BuildContext context) {
        //         return Container(
        //             width: MediaQuery.of(context).size.width,
        //             margin: const EdgeInsets.symmetric(horizontal: 5.0),
        //             decoration: const BoxDecoration(color: Colors.amber),
        //             child: Text(
        //               'text $i',
        //               style: const TextStyle(fontSize: 16.0),
        //             ));
        //       },
        //     );
        //   }).toList(),
        // ),
      ]),
    );
  }
}
