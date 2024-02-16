part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

/// {@template auth_event}
/// LogInViaGoogle class.
/// {@endtemplate}
final class LogInViaGoogle extends AuthEvent {
  /// {@macro auth_event}
}

/// {@template auth_event}
/// LogInViaAppleId class.
/// {@endtemplate}
final class LogInViaAppleId extends AuthEvent {
  /// {@macro auth_event}
}

/// {@template auth_event}
/// LogOut class.
/// {@endtemplate}
final class LogOut extends AuthEvent {
  /// {@macro auth_event}
}
