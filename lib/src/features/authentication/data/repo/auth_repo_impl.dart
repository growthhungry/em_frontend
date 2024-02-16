import 'package:eneler_mariia/src/features/authentication/data/data_sources/auth_data_sources.dart';
import 'package:eneler_mariia/src/features/authentication/domain/entity/user_entity.dart';
import 'package:eneler_mariia/src/features/authentication/domain/repo/auth_repo.dart';

/// {@template auth_repo_impl}
/// AuthRepoImpl class.
/// {@endtemplate}
class AuthRepoImpl implements AuthRepo {
  /// {@macro auth_repo_impl}
  AuthRepoImpl({required this.authDataSources});

  final IAuthDataSources authDataSources;

  @override
  Future<UserEntity> authWithApple() {
    // TODO: implement authWithApple
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> authWithGoogle() async {
    return await authDataSources.loginWithGoogle();
  }

  @override
  Future<void> appleSingOut() {
    // TODO: implement appleSingOut
    throw UnimplementedError();
  }

  @override
  Future<void> googleSingOut() async {
    return await authDataSources.googleSignOut();
  }
}
