part of 'orders_cubit.dart';

class OrdersErrorState extends OrdersState {
  final String? message;

  OrdersErrorState({this.message});
}

final class OrdersInitialState extends OrdersState {}

final class OrdersLoadingState extends OrdersState {}

final class OrdersReadyState extends OrdersState {
  OrdersReadyState(this.response);
    BaseEntity<OrdersEntity> response;

}

abstract class OrdersState {}
