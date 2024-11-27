part of 'offers_cubit.dart';

class OffersErrorState extends OffersState {
  final String? message;

  OffersErrorState({this.message});
}

final class OffersInitialState extends OffersState {}

final class OffersLoadingState extends OffersState {}

final class OffersReadyState extends OffersState {
  OffersReadyState(this.response);
    BaseEntity<OffersEntity> response;

}

abstract class OffersState {}
