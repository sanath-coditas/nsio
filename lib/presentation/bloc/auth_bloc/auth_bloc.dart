import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/usecases/authentication_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationUsecase authenticationUsecase;
  AuthenticationBloc({required this.authenticationUsecase})
      : super(AuthBlocInitial()) {
    on<AuthenticationEvent>((event, emit) {});
    on<SignInWithGoogleEvnet>(_signInWithGoogle);
    on<SignOutEvent>(_signOut);
  }

  FutureOr<void> _signOut(
      SignOutEvent event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());
    final response = await authenticationUsecase.signOut();
    response.fold(
      (l) => emit(
        AuthenticationFailureState(failure: l),
      ),
      (r) => emit(SignOutSuccessState()),
    );
  }


  FutureOr<void> _signInWithGoogle(
      SignInWithGoogleEvnet event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoadingState());

    final response = await authenticationUsecase.signInWithGoogle();

    response.fold(
      (l) => emit(
        AuthenticationFailureState(failure: l),
      ),
      (r) => emit(AuthenticationSuccessState(userCredential: r)),
    );
  }
}
