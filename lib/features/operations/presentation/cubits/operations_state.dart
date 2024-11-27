part of 'operations_cubit.dart';

class OperationsErrorState extends OperationsState {
  final String? message;

  OperationsErrorState({this.message});
}

final class OperationsInitialState extends OperationsState {}

final class OperationsLoadingState extends OperationsState {}

final class OperationsReadyState extends OperationsState {
  OperationsReadyState(this.response);
    BaseEntity<OperationsEntity> response;

}

abstract class OperationsState {}
