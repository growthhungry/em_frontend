import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eneler_mariia/src/common/utils/logger/logger.dart';
import 'package:meta/meta.dart';

import '../../google_auth/domain/repositories/google_auth_repository.dart';

part 'authentication_event.dart';

part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final GoogleAuthRepository googleAuthRepository;

  AuthenticationBloc(this.googleAuthRepository)
      : super(AuthenticationInitial()) {
    on<AuthWithGoogle>(_authWithGoogle);
  }

  Future<void> _authWithGoogle(
      AuthWithGoogle event, Emitter<AuthenticationState> emit) async {
    await googleAuthRepository
        .signIn()
        .then((value) => emit(GoogleAuthCompleted()))
        .catchError((e, stackTrace) {
      logger.e('AUTHENTICATION BLOC EXEPTION : ',
          error: e, stackTrace: stackTrace);
      emit(Failure());
    });
  }



  Future<void> _authWithApple() async {}
}
