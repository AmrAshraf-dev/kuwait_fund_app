part of 'home_cubit.dart';

class HomeErrorState extends HomeState {
  final String? message;

  HomeErrorState({this.message});
}

final class HomeInitialState extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeReadyState extends HomeState {
  HomeReadyState(this.response);
    BaseEntity<HomeEntity> response;

}

abstract class HomeState {}
