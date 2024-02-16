import 'package:eneler_mariia/src/features/authentication/data/model/mapper/user_mapper.dart';
import 'package:eneler_mariia/src/features/authentication/data/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// {@template google_auth}
/// GoogleAuth class.
/// {@endtemplate}
final class GoogleAuth {
  /// {@macro google_auth}

  GoogleAuth._();

  static final GoogleAuth _instance = GoogleAuth._();

  static GoogleAuth get instance => _instance;

  final _googleSignIn = GoogleSignIn(signInOption: SignInOption.standard);

  GoogleSignIn get googleSignIn => _googleSignIn;

  UserModel? _userModel() {
    if (_googleSignIn.currentUser != null) {
      return UserMapper.mapToUserModel(_googleSignIn.currentUser!);
    }
    return null;
  }

  UserModel? get userModel => _userModel();

  Stream<GoogleSignInAccount?> get userStateChanges =>
      _googleSignIn.onCurrentUserChanged;
}
