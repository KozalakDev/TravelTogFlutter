import 'dart:convert';
import 'package:http/http.dart' as http;

class DatabaseService {

//TODO: use pagination
  // Future<List<Category>> getPosts() async {
  //   final response =
  //       await http.get(Uri.parse('http://10.91.116.147:3000/categories'));
  //   final responseBody = response.body;

  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     print(responseBody);
  //     // Category.fromJson(jsonDecode(responseBody));
  //     return Category.categoriesFromJson(jsonDecode(responseBody));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     print(response.body);
  //     throw Exception('Failed to load album');
  //   }
  // }

//TODO: create new function for saving images to firebase

  Future<bool> createPost(
    String title,
    // List<XFile> images
  ) async {
    var url = Uri.http('127.0.0.1:8080', 'api/v1/post/create');

    List<String> imageURLs = [];
    // await Future.forEach(images, (XFile image) async {
    //   await cloudinary
    //       .upload(
    //           file: image.path,
    //           fileBytes: File(image.path).readAsBytesSync(),
    //           resourceType: CloudinaryResourceType.image,
    //           fileName: image.name,
    //           progressCallback: (count, total) {
    //             print('Uploading image from file with progress: $count/$total');
    //           })
    //       .then((value) {
    //     if (value.isSuccessful) {
    //       imageURLs.add(value.secureUrl!);
    //     }
    //   });
    // });

    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: json.encode({
          // 'title': title,
          // 'description': description,
          'imageURLs': ["image1", "image2"],
          'traveller_id': "travellerId"
        }));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }

// print(await http.read(Uri.https('example.com', 'foobar.txt')));

    // final response =
    //     // await http.get(Uri.parse('http://10.51.120.19:5432/signUp'));
    //     await http.post(Uri.parse('http://10.51.120.19:8080/api/v1/post/create'));
    // final responseBody = response.body;
    // if (response.statusCode == 200) {
    //   // If the server did return a 200 OK response,
    //   // then parse the JSON.
    //   print(responseBody);
    //   // Category.fromJson(jsonDecode(responseBody));
    //   // return Category.categoriesFromJson(jsonDecode(responseBody));
    //   return true;
    // } else {
    //   // If the server did not return a 200 OK response,
    //   // then throw an exception.

    //   print(response.body);
    //   throw Exception('Failed to load album');
    // }
  }
}
