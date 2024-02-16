part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();
}

final class AuthInitial extends AuthState {
  @override
  List<Object?> get props => [];
}

/// {@template auth_state}
/// AuthState class.
/// {@endtemplate}
final class AuthCompleted extends AuthState {
  /// {@macro auth_state}

  const AuthCompleted({required this.user});

  final UserEntity user;

  @override
  List<Object?> get props => [user];
}

/// {@template auth_state}
/// AuthFailure class.
/// {@endtemplate}
final class AuthFailure extends AuthState {
  /// {@macro auth_state}
  const AuthFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [];
}

/// {@template auth_state}
/// AuthProcessing class.
/// {@endtemplate}
final class AuthProcessing extends AuthState {
  /// {@macro auth_state}

  @override
  List<Object?> get props => [];
}
