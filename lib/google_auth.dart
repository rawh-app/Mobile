import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

Future<UserCredential> signInWithGoogle() async {
  final googleSignIn = GoogleSignIn();

  await googleSignIn.signOut();
  final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  if (googleUser == null) throw Exception("Google sign-in cancelled");

  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  return await FirebaseAuth.instance.signInWithCredential(credential);
}
