import 'package:eneler_mariia/src/features/authentication/domain/entity/user_entity.dart';
import 'package:eneler_mariia/src/features/authentication/domain/repo/auth_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepo;
  AuthBloc(this.authRepo) : super(AuthInitial()) {
    on<LogInViaGoogle>(_loginViaGoogle);
  }

  Future<void> _loginViaGoogle(
      LogInViaGoogle event, Emitter<AuthState> emit) async {
    await authRepo
        .authWithGoogle()
        .then((user) => emit(AuthCompleted(user: user)))
        .catchError((e, s) {
      emit(AuthFailure(message: e.toString()));
    });
  }

  Future<void> logOut(LogOut event, Emitter<AuthState> emit) async {}
}
