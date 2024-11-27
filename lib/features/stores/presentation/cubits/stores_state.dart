part of 'stores_cubit.dart';

class StoresErrorState extends StoresState {
  final String? message;

  StoresErrorState({this.message});
}

final class StoresInitialState extends StoresState {}

final class StoresLoadingState extends StoresState {}

final class StoresReadyState extends StoresState {
  StoresReadyState(this.response);
    BaseEntity<StoresEntity> response;

}

abstract class StoresState {}
