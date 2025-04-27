import 'package:apple/core/widgets/error_snackbar.dart';
import 'package:apple/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

import 'package:injectable/injectable.dart';

import '../../domain/usecases/google_sign_in.dart';


@Injectable()
class AuthProvider extends ChangeNotifier {
  ///usecase for google sign in
  final GoogleSignIn _googleSignIn;

  User? _user;

  AuthProvider(this._googleSignIn);

  User? get user => _user;

  Future<void> signIn() async {
    var result = await _googleSignIn();
    result.fold(
      (failure) {
      errorSnackBar(context: navigatorState.currentState!.context, message: failure.errorMessage);
        debugPrint('Sign in failed: ${failure.errorMessage}');
      },
      (user) {
        _user = user;
         notifyListeners();
        debugPrint('Sign in successful: ${user?.email}');
      },
    );
   
  }

  // get user data
  Future<void> getUserData() async {
    try {
      _user = FirebaseAuth.instance.currentUser;
      notifyListeners();
    } catch (e) {
      debugPrint('Error getting user data: $e');
    }
  }
}
