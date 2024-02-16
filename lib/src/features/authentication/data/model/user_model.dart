import 'package:eneler_mariia/src/features/authentication/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.email,
      required super.userName,
      required super.photoUrl,
      required super.userId});
}
