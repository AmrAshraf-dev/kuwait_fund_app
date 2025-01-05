part of 'requests_cubit.dart';

class RequestsErrorState extends RequestsState {
  final String? message;

  RequestsErrorState({this.message});
}

final class RequestsInitialState extends RequestsState {}

final class RequestsLoadingState extends RequestsState {}

final class RequestsEmptyState extends RequestsState {}

final class RequestsReadyState extends RequestsState {
  RequestsReadyState(this.response);
  BaseEntity<List<RequestsEntity>> response;
}

abstract class RequestsState {}
