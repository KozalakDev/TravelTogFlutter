import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:team_project_1/services/db_service.dart';

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
      body: SafeArea(
        child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
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
                            ? Row(
                                children: images!
                                    .map((e) => Image.file(
                                          File(e.path),
                                          height: 100,
                                          width: 200,
                                        ))
                                    .toList(),
                              )
                            : Container(),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autofocus: false,
                          controller: titleController,
                          decoration: InputDecoration(
                              labelText: 'title',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              fillColor: Colors.grey.shade100,
                              focusColor: Colors.green),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          autofocus: false,
                          controller: descriptionController,
                          decoration: InputDecoration(
                              labelText: 'description',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              fillColor: Colors.grey.shade100,
                              focusColor: Colors.green),
                        ),
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
                            child: const Text('Post')),
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
