import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  signOut() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    // Sign out from Firebase
    await _auth.signOut();

    // Sign out from Google Sign-In
    await googleSignIn.signOut();
  }
}
