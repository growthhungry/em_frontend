part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

final class Request extends AuthenticationState {}

final class Failure extends AuthenticationState {}

final class GoogleAuthCompleted extends AuthenticationState {}
