import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  // sign in with email and password
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      //_firebaseAuth.currentUser.uid = user.uid; //TODO:
      // DatabaseService(_firebaseAuth)
      //     .updateUserData(_firebaseAuth.currentUser.uid);
      // DatabaseService(_firebaseAuth).updateUserData();
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   try {
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;

  //     // Create a new credential
  //     final GoogleAuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     // Once signed in, return the UserCredential

  //     final UserCredential userCredential =
  //         await FirebaseAuth.instance.signInWithCredential(credential);
  //     DatabaseService(_firebaseAuth).updateUserData();

  //     return userCredential;
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }
}
