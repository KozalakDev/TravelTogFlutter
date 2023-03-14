import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  //TODO: if image is not 4/3 1/1 crop automatically
  Future<List<File>> pickImages() async {
    List<File> croppedImages = [];
    try {
      final List<XFile> imagesTemp = await ImagePicker().pickMultiImage();

      if (imagesTemp.isEmpty) {
        return [];
      }

      List<File> images = imagesTemp.map((e) => File(e.path)).toList();

      for (var element in images) {
        File? croppedImage = await cropImage(element);
        if (croppedImage != null) {
          print("cropped Images: ${croppedImage.path}");
          croppedImages.add(croppedImage);
        }  
      }

      return croppedImages;
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
      return croppedImages;
    }
  }

  Future<File?> cropImage(
    File imageFile,
  ) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      cropStyle: CropStyle.rectangle,
        sourcePath: imageFile.path,
        // aspectRatio: cropAspectRatio,
        // aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1)
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset
              .ratio4x3, //TODO: you can edit these after making sure it work in postContainer
        ]);
    if (croppedFile != null) {
      return File(croppedFile.path);
    } else {
      return null;
    }
  }
}
