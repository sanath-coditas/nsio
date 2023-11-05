import 'package:dartz/dartz.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';
import 'package:nonstopioassignment/domain/repositories/beer_repository.dart';

class BeerUsecase {
  BeerUsecase({required this.beerRepository});
  final BeerRepository beerRepository;
  Future<Either<Failure, List<Beer>>> getBeers({int? page}) {
    return beerRepository.getBeers(page: page);
  }
}
