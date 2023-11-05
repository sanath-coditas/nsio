part of 'auth_bloc.dart';

sealed class AuthenticationState extends Equatable {}

final class AuthBlocInitial extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationLoadingState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}

class AuthenticationFailureState extends AuthenticationState {
  AuthenticationFailureState({required this.failure});
  final Failure failure;
  @override
  List<Object?> get props => [failure];
}

class AuthenticationSuccessState extends AuthenticationState {
  AuthenticationSuccessState({required this.userCredential});
  final UserCredential userCredential;
  @override
  List<Object?> get props => [userCredential];
}

class SignOutSuccessState extends AuthenticationState {
  @override
  List<Object?> get props => [];
}
