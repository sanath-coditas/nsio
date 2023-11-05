import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/repositories/authentication_repository.dart';

class AuthenticationUsecase {
  final AuthenticationRepository authenticationRepository;
  AuthenticationUsecase({required this.authenticationRepository});

  Future<Either<Failure, UserCredential>> signInWithGoogle() {
    return authenticationRepository.signInWithGoogle();
  }
  Future<Either<Failure, void>> signOut() {
    return authenticationRepository.signOut();
  }
}
