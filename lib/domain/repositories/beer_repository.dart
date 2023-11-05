import 'package:dartz/dartz.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';

abstract class BeerRepository {
  Future<Either<Failure, List<Beer>>> getBeers({int? page});
}
