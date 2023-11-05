import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/data/datasources/authentication_datasource.dart';
import 'package:nonstopioassignment/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository{
  final AuthenticationDatasource authenticationDatasource;
  AuthenticationRepositoryImpl({required this.authenticationDatasource});
  
  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() {
    return authenticationDatasource.signInWithGoogle();
  }
  
  @override
  Future<Either<Failure, void>> signOut() {
    
    return authenticationDatasource.signOut();
  }

}