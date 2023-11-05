import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/usecases/authentication_usecase.dart';
import 'package:nonstopioassignment/presentation/bloc/auth_bloc/auth_bloc.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([AuthenticationUsecase, UserCredential])
void main() {
  late AuthenticationBloc authenticationBloc;
  late MockAuthenticationUsecase mockAuthenticationUsecase;
  late MockUserCredential mockUserCredential;

  setUp(() {
    mockAuthenticationUsecase = MockAuthenticationUsecase();
    authenticationBloc =
        AuthenticationBloc(authenticationUsecase: mockAuthenticationUsecase);
    mockUserCredential = MockUserCredential();
  });

  group('AuthenticationBloc', () {
    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationLoadingState, AuthenticationSuccessState] when SignInWithGoogleEvent is added and successful',
      build: () {
        when(mockAuthenticationUsecase.signInWithGoogle())
            .thenAnswer((_) async => Right(mockUserCredential));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SignInWithGoogleEvnet()),
      expect: () => [
        isA<AuthenticationLoadingState>(),
        isA<AuthenticationSuccessState>()
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationLoadingState, AuthenticationFailureState] when SignInWithGoogleEvent is added and fails',
      build: () {
        when(mockAuthenticationUsecase.signInWithGoogle()).thenAnswer(
            (_) async =>
                Left(Failure(message: 'Failed to sign in with Google')));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SignInWithGoogleEvnet()),
      expect: () => [
        isA<AuthenticationLoadingState>(),
        isA<AuthenticationFailureState>()
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationLoadingState, SignOutSuccessState] when SignOutEvent is added and successful',
      build: () {
        when(mockAuthenticationUsecase.signOut())
            .thenAnswer((_) async => const Right(null));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SignOutEvent()),
      expect: () => [
        AuthenticationLoadingState(),
        SignOutSuccessState(),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits [AuthenticationLoadingState, AuthenticationFailureState] when SignOutEvent is added and fails',
      build: () {
        when(mockAuthenticationUsecase.signOut()).thenAnswer(
            (_) async => Left(Failure(message: 'Failed to sign out')));
        return authenticationBloc;
      },
      act: (bloc) => bloc.add(SignOutEvent()),
      expect: () => [
        isA<AuthenticationLoadingState>(),
        isA<AuthenticationFailureState>()
      ],
    );
  });
}
