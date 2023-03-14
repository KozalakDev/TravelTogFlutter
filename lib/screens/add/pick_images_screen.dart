import 'dart:io';

import 'package:flutter/material.dart';
import 'package:travel_tog/routes.dart';
import 'package:travel_tog/size_config.dart';

import '../../services/image_service.dart';
import '../../services/service_locator.dart';
import 'components/image_picker.dart';
import 'components/pick_images_app_bar.dart';

class PickImagesScreen extends StatefulWidget {
  const PickImagesScreen({Key? key}) : super(key: key);

  @override
  State<PickImagesScreen> createState() => _PickImagesScreenState();
}

class _PickImagesScreenState extends State<PickImagesScreen> {
  ValueNotifier<List<File>> images = ValueNotifier<List<File>>([]);
  ValueNotifier<int> pickedImageIndex = ValueNotifier<int>(0);
  File? pickedImage;

  Future getImages() async {
    List<File> tempImages = await getIt.get<ImageService>().pickImages();

    for (var element in tempImages) {
      setState(() {
        images.value.add(element);
      });
    }
  }

  Future editImage() async {
    if (pickedImage != null) {
      File? croppedImage = await getIt
          .get<ImageService>()
          .cropImage(pickedImage!); //TODO update selected image

      if (croppedImage != null) {
        setState(() {
          images.value[pickedImageIndex.value] = croppedImage;
          // images.value.removeAt(pickedImageIndex.value);
          // List.from(images.value)..add(croppedImage);
        });
        images.notifyListeners();
      }
      return croppedImage;
    }
  }

  Future removeImage() async {
    if (pickedImage != null) {
      await pickedImage!.delete();
      setState(() {
        images.value.remove(pickedImage);
      });
    }
  }

  void setPickedImage() {
    pickedImage = images.value[pickedImageIndex.value];
  }

  @override
  void initState() {
    super.initState();
    getImages().whenComplete(() {
      setState(() {
        pickedImage = images.value[pickedImageIndex.value];
      });
    });

    pickedImageIndex.addListener(() {
      print('pickedImageIndex addListener');
      setState(() {
        setPickedImage();
      });
    });

    images.addListener(() {
      print('images addListener');
      setState(() {
        setPickedImage();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pickedImageIndex.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PickImageAppBar(context, images.value),
        body: SafeArea(
            child: Column(
          children: [
            images.value.isNotEmpty
                ? Image.file(
                    File(pickedImage!.path),
                    fit: BoxFit.cover,
                  )
                : Container(),
            Row(
              children: [
                Container(
                  width: SizeConfig.screenWidth! / 3,
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () async {
                        await getImages();
                      },
                      icon: const Icon(Icons.add_photo_alternate_outlined)),
                ),
                Container(
                  width: SizeConfig.screenWidth! / 3,
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () async {
                        await editImage();
                      },
                      icon: const Icon(Icons.crop_rounded)),
                ),
                Container(
                  width: SizeConfig.screenWidth! / 3,
                  alignment: Alignment.center,
                  child: IconButton(
                      onPressed: () async {
                        await removeImage();
                      },
                      icon: const Icon(Icons.delete_outline_rounded)),
                ),
              ],
            ),
            ImagesGridView(
                imageFiles: images.value,
                changeIndex: (newValue) => pickedImageIndex.value = newValue),
          ],
        )));
  }
}
