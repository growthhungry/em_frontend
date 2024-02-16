import 'package:eneler_mariia/src/features/authentication/data/model/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

final class UserMapper {
  static UserModel mapToUserModel(GoogleSignInAccount account) {
    return UserModel(
        email: account.email,
        userName: account.displayName ?? 'User name not found',
        photoUrl: 'http://${account.photoUrl}' ?? 'Phonto url not foung',
        userId: account.id);
  }
}
