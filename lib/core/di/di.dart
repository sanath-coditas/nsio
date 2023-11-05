import 'package:get_it/get_it.dart';
import 'package:nonstopioassignment/data/datasources/authentication_datasource.dart';
import 'package:nonstopioassignment/data/datasources/beer_remote_datasource.dart';
import 'package:nonstopioassignment/data/repositories/authentication_repository_impl.dart';
import 'package:nonstopioassignment/data/repositories/beer_repository_impl.dart';
import 'package:nonstopioassignment/domain/repositories/authentication_repository.dart';
import 'package:nonstopioassignment/domain/repositories/beer_repository.dart';
import 'package:nonstopioassignment/domain/usecases/authentication_usecase.dart';
import 'package:nonstopioassignment/domain/usecases/beer_usecase.dart';
import 'package:nonstopioassignment/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:nonstopioassignment/presentation/bloc/home_bloc/home_bloc.dart';

class Injector {
  static void setUp() {
    GetIt.I
      // Datasources
      ..registerLazySingleton<AuthenticationDatasource>(
          () => AuthenticationDatasource())
      ..registerLazySingleton<BeerRemoteDatasource>(
          () => BeerRemoteDatasource())

      // repositories
      ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(
          authenticationDatasource: GetIt.I<AuthenticationDatasource>(),
        ),
      )
      ..registerLazySingleton<BeerRepository>(
        () => BeerRepositoryImpl(
          beerRemoteDatasource: GetIt.I<BeerRemoteDatasource>(),
        ),
      )

      // usecases
      ..registerLazySingleton<AuthenticationUsecase>(
        () => AuthenticationUsecase(
          authenticationRepository: GetIt.I<AuthenticationRepository>(),
        ),
      )
      ..registerLazySingleton<BeerUsecase>(
        () => BeerUsecase(
          beerRepository: GetIt.I<BeerRepository>(),
        ),
      )

      //blocs
      ..registerFactory<AuthenticationBloc>(
        () => AuthenticationBloc(
          authenticationUsecase: GetIt.I<AuthenticationUsecase>(),
        ),
      )
      ..registerFactory<HomeBloc>(
        () => HomeBloc(
          beerUsecase: GetIt.I<BeerUsecase>(),
        ),
      );
  }
}
