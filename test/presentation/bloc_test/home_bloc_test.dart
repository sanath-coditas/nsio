import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';
import 'package:nonstopioassignment/domain/usecases/beer_usecase.dart';
import 'package:nonstopioassignment/presentation/bloc/home_bloc/home_bloc.dart';

import 'home_bloc_test.mocks.dart';

@GenerateMocks([BeerUsecase])
void main() {
  late HomeBloc homeBloc;
  late MockBeerUsecase mockBeerUsecase;

  setUp(() {
    mockBeerUsecase = MockBeerUsecase();
    homeBloc = HomeBloc(beerUsecase: mockBeerUsecase);
  });

  group('HomeBloc', () {
    // Define your test cases here
    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeLoadedState] when GetBeers is added and successful',
      build: () {
        when(mockBeerUsecase.getBeers())
            .thenAnswer((_) async => Right([Beer(id: 1, name: 'Beer 1')]));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GetBeers(isPullToRefresh: false)),
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeLoadedState>(),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeFailureState] when GetBeers is added and fails',
      build: () {
        when(mockBeerUsecase.getBeers()).thenAnswer(
            (_) async => Left(Failure(message: 'Failed to fetch beers')));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GetBeers(isPullToRefresh: false)),
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeFailureState>(),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeLoadedState] with PullToRefresh when GetBeers is added with isPullToRefresh true and successful',
      build: () {
        when(mockBeerUsecase.getBeers())
            .thenAnswer((_) async => Right([Beer(id: 3, name: 'Beer 3')]));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GetBeers(isPullToRefresh: true)),
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeLoadedState>(),
      ],
    );

    blocTest<HomeBloc, HomeState>(
      'emits [HomeLoadingState, HomeFailureState] with PullToRefresh when GetBeers is added with isPullToRefresh true and fails',
      build: () {
        when(mockBeerUsecase.getBeers()).thenAnswer(
            (_) async => Left(Failure(message: 'Failed to fetch beers')));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GetBeers(isPullToRefresh: true)),
      expect: () => [
        isA<HomeLoadingState>(),
        isA<HomeFailureState>(),
      ],
    );
  });
}
