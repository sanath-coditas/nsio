import 'package:dartz/dartz.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/data/datasources/beer_remote_datasource.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';
import 'package:nonstopioassignment/domain/repositories/beer_repository.dart';

class BeerRepositoryImpl implements BeerRepository {
  BeerRepositoryImpl({
    required this.beerRemoteDatasource,
  });
  final BeerRemoteDatasource beerRemoteDatasource;

  @override
  Future<Either<Failure, List<Beer>>> getBeers({int? page}) {
    return beerRemoteDatasource.getBeers(page:page);
  }
}
