import 'dart:io';

import 'package:flutter/material.dart';

class ImagesGridView extends StatefulWidget {
  ImagesGridView({Key? key, required this.imageFiles}) : super(key: key);

  List<File?> imageFiles;
  @override
  State<ImagesGridView> createState() => _ImagesGridViewState();
}

class _ImagesGridViewState extends State<ImagesGridView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
          physics: const ScrollPhysics(),
          itemCount: widget.imageFiles.length,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (BuildContext context, int index) {
            return Image.file(
              File(widget.imageFiles[index]!.path),
              fit: BoxFit.cover,
            );
          }),
    );
  }
}
