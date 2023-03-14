// import 'package:ciceksepeti_database_management/screens/authentication/auth_screen.dart';
import 'package:travel_tog/screens/add/add_screen.dart';
import 'package:travel_tog/screens/add/pick_images_screen.dart';

const addRouteName = '/addPost';
const pickImagesRouteName = '/pickImages';

final routes = {
  addRouteName: (context) => const AddPostScreen(),
  pickImagesRouteName: (context) => const PickImagesScreen(),
};
