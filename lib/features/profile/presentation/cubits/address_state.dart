part of 'address_cubit.dart';

class AddressErrorState extends AddressState {
  final String? message;

  AddressErrorState({this.message});
}

final class AddressInitialState extends AddressState {}

final class AddressLoadingState extends AddressState {}

final class AddressReadyState extends AddressState {
  AddressReadyState(this.response);
  BaseEntity<MyAddressEntity> response;
}

abstract class AddressState {}
