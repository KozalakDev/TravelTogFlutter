import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      print(user);
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);

      // DatabaseService(_firebaseAuth).updateUserData();

      return userCredential;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> signOut(context) async {
    try {
      // return Future.delayed(Duration.zero);
      await _firebaseAuth.signOut();

      //TODO: go to myapp if you cannot fix error
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => MyApp()));
    } catch (error) {
      print(error);
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
