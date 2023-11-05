part of 'auth_bloc.dart';

sealed class AuthenticationState {}

final class AuthBlocInitial extends AuthenticationState {}

class AuthenticationLoadingState extends AuthenticationState {}

class AuthenticationFailureState extends AuthenticationState {
  AuthenticationFailureState({required this.failure});
  final Failure failure;
}

class AuthenticationSuccessState extends AuthenticationState {
  AuthenticationSuccessState({required this.userCredential});
  final UserCredential userCredential;
}

class SignOutSuccessState extends AuthenticationState {}
