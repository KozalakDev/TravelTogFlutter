import 'dart:io';
import 'package:flutter/material.dart';

class ImagesGridView extends StatefulWidget {
  ImagesGridView(
      {Key? key, required this.imageFiles, required this.changeIndex})
      : super(key: key);

  List<File?> imageFiles;
  final ValueChanged changeIndex;

  @override
  State<ImagesGridView> createState() => _ImagesGridViewState();
}

class _ImagesGridViewState extends State<ImagesGridView> {
  double imageHeight = 50;
  int pickedImageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      constraints: BoxConstraints(
        minHeight: imageHeight,
      ),
      child: widget.imageFiles.isNotEmpty
          ? GridView.builder(
              physics: const ScrollPhysics(),
              itemCount: widget.imageFiles.length,
              shrinkWrap: true,
              // padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      pickedImageIndex = index;
                      widget.changeIndex(index);
                    });
                  },
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: pickedImageIndex == index
                          ? Colors.grey.shade400
                          : Colors.transparent,
                      width: 2,
                    )),
                    child: Image.file(
                      File(widget.imageFiles[index]!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              })
          : Container(),
    );
  }
}
