part of 'create_request_cubit.dart';

class CreateRequestErrorState extends CreateRequestState {
  final String? message;

  CreateRequestErrorState({this.message});
}

final class CreateRequestInitialState extends CreateRequestState {}

final class CreateRequestLoadingState extends CreateRequestState {}

final class CreateRequestReadyState extends CreateRequestState {
  CreateRequestReadyState(this.response);
    BaseEntity<CreateRequestEntity> response;

}

abstract class CreateRequestState {}
