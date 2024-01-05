import 'package:eneler_mariia/src/features/authentication/google_auth/data/data_sources/google_auth_data_sources.dart';
import 'package:eneler_mariia/src/features/authentication/google_auth/domain/repositories/google_auth_repository.dart';

final class GoogleAuthRepositoryImpl implements GoogleAuthRepository {
  GoogleAuthRepositoryImpl({required this.googleAuthDataSources});

  final IGoogleAuthDataSources googleAuthDataSources;

  @override
  Future<void> logOut() async {
    await googleAuthDataSources.logOut();
  }

  @override
  Future<void> signIn() async {
    await googleAuthDataSources.signIn();
  }
}
