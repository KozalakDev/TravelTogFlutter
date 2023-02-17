import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:team_project_1/routes.dart';
import 'package:team_project_1/screens/components/post_container.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const PostContainer();
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

            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, addRouteName);
                },
                child: const Text('Share your travel'))
          ]),
        ),
      ),
    );
  }
}
