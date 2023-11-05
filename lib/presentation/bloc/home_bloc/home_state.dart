// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeFailureState extends HomeState {
  HomeFailureState({required this.failure});
  final Failure failure;
}

class HomeLoadedState extends HomeState {
  HomeLoadedState({
    required this.beers,
    this.isFetching = false,
  });
  final List<Beer> beers;
  final bool isFetching;
  HomeLoadedState copyWith({
    List<Beer>? beers,
    bool? isFetching,
  }) {
    return HomeLoadedState(
      beers: beers ?? this.beers,
      isFetching: isFetching ?? this.isFetching,
    );
  }
}
