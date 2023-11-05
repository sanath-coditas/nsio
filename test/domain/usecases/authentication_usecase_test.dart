import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/repositories/authentication_repository.dart';
import 'package:nonstopioassignment/domain/usecases/authentication_usecase.dart';

import 'authentication_usecase_test.mocks.dart';

@GenerateMocks([AuthenticationRepository, UserCredential])
void main() {
  late AuthenticationUsecase authenticationUsecase;
  late AuthenticationRepository mockAuthenticationRepository;

  setUp(() {
    mockAuthenticationRepository = MockAuthenticationRepository();
    authenticationUsecase = AuthenticationUsecase(
        authenticationRepository: mockAuthenticationRepository);
  });

  test('signInWithGoogle should return a UserCredential on success', () async {
    final mockUserCredential = MockUserCredential();
    when(mockAuthenticationRepository.signInWithGoogle())
        .thenAnswer((_) async => Right(mockUserCredential));

    final result = await authenticationUsecase.signInWithGoogle();

    expect(result, isA<Right<Failure, UserCredential>>());
    verify(mockAuthenticationRepository.signInWithGoogle());
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });

  test('signInWithGoogle should return a Failure on error', () async {
    final failure = Failure(message: "Some error message");
    when(mockAuthenticationRepository.signInWithGoogle())
        .thenAnswer((_) async => Left(failure));

    final result = await authenticationUsecase.signInWithGoogle();

    expect(result, isA<Left<Failure, UserCredential>>());
    verify(mockAuthenticationRepository.signInWithGoogle());
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });

  test('signOut should return void on success', () async {
    when(mockAuthenticationRepository.signOut())
        .thenAnswer((_) async => const Right(null));

    final result = await authenticationUsecase.signOut();

    expect(result, isA<Right<Failure, void>>());
    verify(mockAuthenticationRepository.signOut());
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });

  test('signOut should return a Failure on error', () async {
    final failure = Failure(message: "Some error message");
    when(mockAuthenticationRepository.signOut())
        .thenAnswer((_) async => Left(failure));

    final result = await authenticationUsecase.signOut();

    expect(result, isA<Left<Failure, void>>());
    verify(mockAuthenticationRepository.signOut());
    verifyNoMoreInteractions(mockAuthenticationRepository);
  });
}
