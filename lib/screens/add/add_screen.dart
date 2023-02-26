import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_project_1/consts.dart';
import 'package:team_project_1/screens/add/components/location_picker.dart';
import 'package:team_project_1/screens/components/rating_list_tile.dart';
import 'package:team_project_1/size_config.dart';

import '../../services/db_service.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  List<XFile>? images = [];

  Future pickImages() async {
    try {
      final List<XFile> imagesTemp = await ImagePicker().pickMultiImage();
      // if (imagesTemp.isNotEmpty) {
      //   images!.addAll(imagesTemp);
      // }
      if (imagesTemp.isNotEmpty) {
        setState(() => images = imagesTemp);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? textEditingController;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              // physics: BouncingScrollPhysics(),
              ListView(shrinkWrap: true, children: [
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Form(
                    // key: _formkey,
                    child: Column(
                      children: [
                        // Row(
                        //   children: const [
                        //     Text(
                        //       'Pick images:',
                        //       style: TextStyle(fontSize: 17),
                        //     ),
                        //     // Imagepicker(),
                        //   ],
                        // ),
                        // Expanded(
                        //   child: Padding(
                        //     padding: const EdgeInsets.all(8.0),
                        //     child: GridView.builder(
                        //         itemCount: images!.length,
                        //         gridDelegate:
                        //             SliverGridDelegateWithFixedCrossAxisCount(
                        //                 crossAxisCount: 3),
                        //         itemBuilder: (BuildContext context, int index) {
                        //           return Image.file(
                        //             File(images![index].path),
                        //             fit: BoxFit.cover,
                        //           );
                        //         }),
                        //   ),
                        // ),
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
                          // subtitle: LocationPicker(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              RatingListTile(
                                disable: false,
                                text: "Food",
                                rate: 3,
                              ),
                              RatingListTile(
                                  disable: false, text: "Staying", rate: 3),
                              RatingListTile(
                                  disable: false, text: "Activities", rate: 3),
                              RatingListTile(
                                  disable: false,
                                  text: "Transportation",
                                  rate: 3),
                              RatingListTile(
                                  disable: false, text: "Nature", rate: 3),
                              RatingListTile(
                                  disable: false, text: "Pricing", rate: 3),
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
                                    await DatabaseService().createPost(
                                        textEditingController!.text, images!);
                                  },
                                  child: const Text('Publish Post'),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )),
          ]),
        )));
  }
}
