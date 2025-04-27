import 'package:apple/core/errors/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

abstract class SocialLogins {
  ///this function used to google signin
  ///send argument as[SignUpParams]

  Future<User?> googleSignIn();
}

@Injectable(as: SocialLogins)
class SocialLoginsImpl implements SocialLogins {
  SocialLoginsImpl();

  @override
  Future<User?> googleSignIn() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account == null) {
        throw ServerException(message: "Google Sign-In aborted by user.");
      }

      final GoogleSignInAuthentication googleAuth =
          await account.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      throw ServerException(message: "Google Sign-In failed: $e");
    }
  }
}
