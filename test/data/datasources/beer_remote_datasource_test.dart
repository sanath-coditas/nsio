import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/data/datasources/beer_remote_datasource.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';

import 'beer_remote_datasource_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late BeerRemoteDatasource beerRemoteDatasource;
  late Dio mockDioClient;

  setUp(() {
    mockDioClient = MockDio();
    beerRemoteDatasource = BeerRemoteDatasource();
  });

  group('test BeerRemote datasource', () {
    test('getBeers should return a list of Beer entities on success', () async {
      final mockApiResponse =
          List.generate(30, (index) => {'id': 1, 'name': 'Beer 1'});

      when(mockDioClient.get('')).thenAnswer(
        (_) async => Response(
          requestOptions: RequestOptions(),
          data: mockApiResponse,
          statusCode: 200,
          statusMessage: 'OK',
        ),
      );

      final result = await beerRemoteDatasource.getBeers();

      expect(result, isA<Right<Failure, List<Beer>>>());
      final beers = result.getOrElse(() => []);
      expect(beers, hasLength(30));
      expect(beers[0], isA<Beer>());
      expect(beers[1], isA<Beer>());

      verifyNoMoreInteractions(mockDioClient);
    });
  });
}
