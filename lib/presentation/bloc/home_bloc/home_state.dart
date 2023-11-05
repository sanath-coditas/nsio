part of 'home_bloc.dart';

sealed class HomeState extends Equatable {}

final class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadingState extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeFailureState extends HomeState {
  HomeFailureState({required this.failure});
  final Failure failure;

  @override
  List<Object?> get props => [failure];
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

  @override
  List<Object?> get props => [
        beers,
        isFetching,
      ];
}
