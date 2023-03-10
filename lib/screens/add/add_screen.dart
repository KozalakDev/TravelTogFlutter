import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:travel_tog/consts.dart';
import 'package:travel_tog/screens/add/components/image_picker.dart';
import 'package:travel_tog/screens/components/rating_list_tile.dart';
import 'package:travel_tog/services/image_service.dart';
import 'package:travel_tog/services/service_locator.dart';
import 'package:travel_tog/size_config.dart';

import '../../services/db_service.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  List<File> images = [];

  final Map<String, double> ratingsMap = {
    'Food': 0,
    'Staying': 0,
    'Activites': 0,
    'Transportation': 0,
    'Nature': 0,
    'Pricing': 0
  };

  TextEditingController? textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController?.dispose();
  }

  void changeRating(String field, double value) {
    ratingsMap[field] = value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Create Post'),
          titleTextStyle: Theme.of(context).textTheme.titleLarge,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
            child: ListView(shrinkWrap: true, children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: Form(
                  // key: _formkey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        images.isEmpty
                            ? ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                ),
                                onPressed: () async {
                                  List<File> tempImages = await getIt
                                      .get<ImageService>()
                                      .pickImages();
                                  setState(() {
                                    images = tempImages;
                                  });
                                },
                                icon: const Icon(Icons.image),
                                label: const Text('Pick Images'))
                            : ImagesGridView(
                                imageFiles: images,
                              ),
                        TextFormField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                              // fillColor: Colors.amber,
                              contentPadding: const EdgeInsets.all(10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade400)),
                              hintText: "Create a great post today...",
                              hintStyle:
                                  TextStyle(color: Colors.grey.shade400)),
                          maxLines: 7,
                        ),
                        ListTile(
                          contentPadding: const EdgeInsets.all(0),
                          leading: const Icon(
                            Icons.add_location_alt_outlined,
                            color: Colors.black,
                            size: 30,
                          ),
                          title: Text(
                            "Add Location",
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          // subtitle: const LocationPicker(),
                        ),
                        Column(
                          children: [
                            ...ratingsMap.entries
                                .map((e) => RatingListTile(
                                    text: e.key,
                                    disable: false,
                                    changeRating: changeRating))
                                .toList(),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              width: SizeConfig.screenWidth! - 20,
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  backgroundColor: primaryColor,
                                ),
                                onPressed: () async {
                                  await DatabaseService()
                                      .createPost(textEditingController!.text);
                                  // print(ratingsMap);
                                },
                                child: const Text('Publish Post'),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ])));
  }
}
