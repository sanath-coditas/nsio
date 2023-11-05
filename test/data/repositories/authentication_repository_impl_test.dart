import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/data/datasources/authentication_datasource.dart';
import 'package:nonstopioassignment/data/repositories/authentication_repository_impl.dart';

import 'authentication_repository_impl_test.mocks.dart';

@GenerateMocks([AuthenticationDatasource,UserCredential])
void main() {
  late AuthenticationRepositoryImpl authenticationRepository;
  late AuthenticationDatasource mockDatasource;

  setUp(() {
    mockDatasource = MockAuthenticationDatasource();
    authenticationRepository =
        AuthenticationRepositoryImpl(authenticationDatasource: mockDatasource);
  });

  group('test AuthenticationRepositoryImpl', () {
    test('signInWithGoogle should return UserCredential on success', () async {
      final userCredential = MockUserCredential();
      when(mockDatasource.signInWithGoogle())
          .thenAnswer((_) async {
            return Right<Failure, UserCredential>(userCredential);
          }
          );

      final result = await authenticationRepository.signInWithGoogle();

      expect(result, equals(Right<Failure, UserCredential>(userCredential)));
      verify(mockDatasource.signInWithGoogle());
      verifyNoMoreInteractions(mockDatasource);
    });

    test('signInWithGoogle should return a Failure on error', () async {
      final failure = Failure(message: "Some error message");
      when(mockDatasource.signInWithGoogle())
          .thenAnswer((_) async => Left(failure));

      final result = await authenticationRepository.signInWithGoogle();

      expect(result, isA<Left<Failure, UserCredential>>());
      verify(mockDatasource.signInWithGoogle());
      verifyNoMoreInteractions(mockDatasource);
    });

    test('signOut should return void on success', () async {
      when(mockDatasource.signOut()).thenAnswer((_) async => const Right(null));

      final result = await authenticationRepository.signOut();

      expect(result, isA<Right<Failure, void>>());
      verify(mockDatasource.signOut());
      verifyNoMoreInteractions(mockDatasource);
    });

    test('signOut should return a Failure on error', () async {
      final failure = Failure(message: "Some error message");
      when(mockDatasource.signOut()).thenAnswer((_) async => Left(failure));

      final result = await authenticationRepository.signOut();

      expect(result, isA<Left<Failure, void>>());
      verify(mockDatasource.signOut());
      verifyNoMoreInteractions(mockDatasource);
    });
  });
}
