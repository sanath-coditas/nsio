import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/data/datasources/beer_remote_datasource.dart';
import 'package:nonstopioassignment/data/repositories/beer_repository_impl.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';

import 'beer_repository_impl_test.mocks.dart';

@GenerateMocks([BeerRemoteDatasource])
void main() {
  late BeerRepositoryImpl beerRepository;
  late BeerRemoteDatasource mockRemoteDatasource;

  setUp(() {
    mockRemoteDatasource = MockBeerRemoteDatasource();
    beerRepository =
        BeerRepositoryImpl(beerRemoteDatasource: mockRemoteDatasource);
  });

  group('test BeerRepository', () { 
    test('getBeers should return a list of Beer entities on success', () async {
    final List<Beer> mockBeers = [
      Beer(id: 1, name: "Beer 1"),
      Beer(id: 2, name: "Beer 2")
    ];
    when(mockRemoteDatasource.getBeers(page: null))
        .thenAnswer((_) async => Right(mockBeers));

    final result = await beerRepository.getBeers();

    expect(result, isA<Right<Failure, List<Beer>>>());
    expect(result.getOrElse(() => []), mockBeers);
    verify(mockRemoteDatasource.getBeers(page: null));
    verifyNoMoreInteractions(mockRemoteDatasource);
  });

  test('getBeers should return a Failure on error', () async {
    final failure = Failure(message: "Some error message");
    when(mockRemoteDatasource.getBeers(page: null))
        .thenAnswer((_) async => Left(failure));

    final result = await beerRepository.getBeers();

    expect(result, isA<Left<Failure, List<Beer>>>());
    expect(result.leftMap((l) => l.message), Left(failure.message));
    verify(mockRemoteDatasource.getBeers(page: null));
    verifyNoMoreInteractions(mockRemoteDatasource);
  });
  });
}
