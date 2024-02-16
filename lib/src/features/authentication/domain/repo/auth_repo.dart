import 'package:eneler_mariia/src/features/authentication/domain/entity/user_entity.dart';

/// {@template auth_repo}
/// AuthRepo class.
/// {@endtemplate}
abstract interface class AuthRepo {
  /// {@macro auth_repo}

  Future<UserEntity> authWithGoogle();
  Future<UserEntity> authWithApple();
  Future<void> googleSingOut();
  Future<void> appleSingOut();
}
