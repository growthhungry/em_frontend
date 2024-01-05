import 'package:google_sign_in/google_sign_in.dart';

abstract interface class IGoogleAuthDataSources {
  Future<void> signIn();

  Future<void> logOut();
}

class GoogleAuthDataSources implements IGoogleAuthDataSources {
  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'https://www.googleapis.com/auth/drive',
    ],
  );

  @override
  Future<void> logOut() async {
    try {
      await googleSignIn.signOut();
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }

  @override
  Future<void> signIn() async {
    try {
      await googleSignIn.signIn();
    } on Object catch (e, stackTrace) {
      Error.throwWithStackTrace(e, stackTrace);
    }
  }
}
