import 'package:eneler_mariia/src/features/authentication/data/data_sources/external/google_auth.dart';
import 'package:eneler_mariia/src/features/authentication/data/model/mapper/user_mapper.dart';
import 'package:eneler_mariia/src/features/authentication/data/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// {@template auth_data_sources}
/// IAuthDataSources class.
/// {@endtemplate}
abstract interface class IAuthDataSources {
  /// {@macro auth_data_sources}

  Future<UserModel> loginWithGoogle();
  Future<UserModel> loginWithApple();
  Future<void> appleSignOut();
  Future<void> googleSignOut();
}

/// {@template auth_data_sources}
/// AuthDataSources class.
/// {@endtemplate}
final class AuthDataSources implements IAuthDataSources {
  /// {@macro auth_data_sources}
  final googleInstance = GoogleAuth.instance;
  @override
  Future<UserModel> loginWithApple() {
    // TODO: implement loginWithApple
    throw UnimplementedError();
  }

  @override
  Future<UserModel> loginWithGoogle() async {
    try {
      final credential = await googleInstance.googleSignIn.signIn();

      if (credential != null) {
        return UserMapper.mapToUserModel(credential);
      } else {
        throw Exception('User credential not found');
      }
    } catch (error, stack) {
      Error.throwWithStackTrace(error, stack);
    }
  }

  @override
  Future<void> appleSignOut() {
    // TODO: implement appleSignOut
    throw UnimplementedError();
  }

  @override
  Future<void> googleSignOut() async {
    await googleInstance.googleSignIn.signOut();
  }
}
