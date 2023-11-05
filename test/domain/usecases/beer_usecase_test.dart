import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';
import 'package:nonstopioassignment/domain/repositories/beer_repository.dart';
import 'package:nonstopioassignment/domain/usecases/beer_usecase.dart';

import 'beer_usecase_test.mocks.dart';

@GenerateMocks([BeerRepository])
void main() {
  late BeerUsecase beerUsecase;
  late BeerRepository mockBeerRepository;

  setUp(() {
    mockBeerRepository = MockBeerRepository();
    beerUsecase = BeerUsecase(beerRepository: mockBeerRepository);
  });

  test('getBeers should return a list of Beer entities on success', () async {
    final mockBeers = [
      Beer(id: 1, name: 'Beer 1'),
      Beer(id: 2, name: 'Beer 2')
    ];
    when(mockBeerRepository.getBeers(page: null))
        .thenAnswer((_) async => Right(mockBeers));

    final result = await beerUsecase.getBeers();

    expect(result, isA<Right<Failure, List<Beer>>>());
    final beers = result.getOrElse(() => []);
    expect(beers, hasLength(2));
    expect(beers[0], isA<Beer>());
    expect(beers[1], isA<Beer>());

    verify(mockBeerRepository.getBeers(page: null));
    verifyNoMoreInteractions(mockBeerRepository);
  });

  test('getBeers should return a Failure on error', () async {
    final failure = Failure(message: "Some error message");
    when(mockBeerRepository.getBeers(page: null))
        .thenAnswer((_) async => Left<Failure, List<Beer>>(failure));

    final result = await beerUsecase.getBeers();

    expect(result, isA<Left<Failure, List<Beer>>>());
    verify(mockBeerRepository.getBeers(page: null));
    verifyNoMoreInteractions(mockBeerRepository);
  });
}
