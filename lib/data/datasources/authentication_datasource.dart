import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nonstopioassignment/core/failure.dart';

class AuthenticationDatasource {
  final firebaseInstance = FirebaseAuth.instance;

  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      return Right(
        await firebaseInstance.signInWithProvider(
          GoogleAuthProvider(),
        ),
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  Future<Either<Failure, void>> signOut() async {
    try {
      await firebaseInstance.signOut();
      return const Right(null);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
