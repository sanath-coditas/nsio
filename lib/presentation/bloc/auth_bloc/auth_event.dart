part of 'auth_bloc.dart';

sealed class AuthenticationEvent {}


class SignInWithGoogleEvnet extends AuthenticationEvent{}

class CheckAuthenticatedUser extends AuthenticationEvent{}

class SignOutEvent extends AuthenticationEvent{}
