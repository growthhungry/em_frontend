part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

final class AuthWithGoogle extends AuthenticationEvent {}

final class AuthWithApple extends AuthenticationEvent {}
