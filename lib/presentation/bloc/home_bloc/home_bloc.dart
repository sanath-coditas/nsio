import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nonstopioassignment/core/failure.dart';
import 'package:nonstopioassignment/domain/entities/beer_entity.dart';
import 'package:nonstopioassignment/domain/usecases/beer_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BeerUsecase beerUsecase;
  HomeBloc({required this.beerUsecase}) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<GetBeers>(_getBeers);
    on<GetNextPageBeers>(_getNextPageBeers);
  }

  FutureOr<void> _getNextPageBeers(
      GetNextPageBeers event, Emitter<HomeState> emit) async {
    emit((state as HomeLoadedState).copyWith(isFetching: true));
    final response = await beerUsecase.getBeers(page: event.page);
    response.fold(
      (l) => emit(
        HomeFailureState(failure: l),
      ),
      (r) {
        beersList.addAll(r);
        emit(HomeLoadedState(beers: beersList));
      },
    );
  }

  FutureOr<void> _getBeers(GetBeers event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());

    final response = await beerUsecase.getBeers();
    response.fold(
      (l) => emit(
        HomeFailureState(failure: l),
      ),
      (r) {
        if (event.isPullToRefresh ?? false) {
          beersList.clear();
        }
        beersList.addAll(r);
        emit(HomeLoadedState(beers: beersList));
      },
    );
  }

  List<Beer> beersList = [];
}
