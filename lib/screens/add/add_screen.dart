import 'dart:io';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_project_1/screens/components/rating_list_tile.dart';
import 'package:team_project_1/services/db_service.dart';

import 'components/rate_column.dart';

class AddScreen extends StatefulWidget {
  AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController titleController;
  late TextEditingController descriptionController;

  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

    super.dispose();
  }

  List<XFile>? images = [];

  Future pickImages() async {
    try {
      final List<XFile> imagesTemp = await ImagePicker().pickMultiImage();
      // if (imagesTemp.isNotEmpty) {
      //   images!.addAll(imagesTemp);
      // }
      if (imagesTemp.isNotEmpty) {
        setState(() => this.images = imagesTemp);
      }
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: ListView(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              pickImages();
                            },
                            child: const Text('Pick images')),
                        const SizedBox(
                          height: 20,
                        ),
                        images != null
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: images!
                                      .map((e) => Image.file(
                                            File(e.path),
                                            height: 100,
                                            width: 200,
                                          ))
                                      .toList(),
                                ),
                              )
                            : Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: titleController,
                          decoration: InputDecoration(
                              fillColor: Colors.grey..shade400,
                              contentPadding: EdgeInsets.all(10),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.grey..shade400)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide:
                                      BorderSide(color: Colors.grey..shade400)),
                              hintText: "Create a great post today...",
                              hintStyle:
                                  TextStyle(color: Colors.grey..shade400)),
                          maxLines: 7,
                        ),
                        const SizedBox(
                          height: 20,
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
                          // subtitle: CSCPicker(),
                        ),
                        const RateColumn(),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              await DatabaseService().createPost(
                                  titleController.text,
                                  descriptionController.text,
                                  images!);
                            },
                            child: const Text('Create Post')),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
