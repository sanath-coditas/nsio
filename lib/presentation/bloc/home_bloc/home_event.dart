part of 'home_bloc.dart';


sealed class HomeEvent {}

class GetBeers extends HomeEvent{
  final bool? isPullToRefresh;
  GetBeers({this.isPullToRefresh});
}

class GetNextPageBeers extends HomeEvent{
  GetNextPageBeers({required this.page});
  final int page;
}