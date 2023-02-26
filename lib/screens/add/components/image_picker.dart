// import 'package:flutter/material.dart';

// class ImagePicker extends StatefulWidget {
//   const ImagePicker({Key? key}) : super(key: key);

//   @override
//   State<ImagePicker> createState() => _ImagePickerState();
// }

// class _ImagePickerState extends State<ImagePicker> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Expanded(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: GridView.builder(
//                 itemCount: imageFileList!.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3),
//                 itemBuilder: (BuildContext context, int index) {
//                   return Image.file(
//                     File(imageFileList![index].path),
//                     fit: BoxFit.cover,
//                   );
//                 }),
//           ),
//         ),
//         const SizedBox(height: 32),
//       ],
//     );
//   }
// }
