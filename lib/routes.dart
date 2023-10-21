// import 'package:ciceksepeti_database_management/screens/authentication/auth_screen.dart';
import 'package:travel_tog/screens/add/add_screen.dart';
import 'package:travel_tog/screens/add/pick_images_screen.dart';
import 'package:travel_tog/screens/login/components/reset_password.dart';
import 'package:travel_tog/screens/login/components/sign_up.dart';
import 'package:travel_tog/screens/login/login_screen.dart';

const addRouteName = '/addPost';
const pickImagesRouteName = '/pickImages';
const resetPasswordRouteName = '/resetPassword';
const signUpRouteName = '/signUp';
const loginRouteName = '/login';

final routes = {
  addRouteName: (context) => const AddPostScreen(),
  pickImagesRouteName: (context) => const PickImagesScreen(),
  resetPasswordRouteName: (context) => const ResetPasswordScreen(),
  signUpRouteName: (context) => const SignUp(),
  loginRouteName: (context) => LoginScreen(),
};
