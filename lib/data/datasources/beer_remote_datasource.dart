import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/data/models/beer_model.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';

class BeerRemoteDatasource {
  final Dio _client = Dio();

  Future<Either<Failure, List<Beer>>> getBeers({int? page}) async {
    try {
      final response = await _client.get(
          'https://api.punkapi.com/v2/beers?page=${page ?? 1}&per_page=30');
      if (response.statusCode == 200) {
        final List<Beer> beers = [];
        for (var element in (response.data as List<dynamic>)) {
          beers.add(BeerModel.fromJson(element));
        }
        return Right(beers);
      } else {
        return Left(
          Failure(message: response.statusMessage ?? 'Something Wrong'),
        );
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
