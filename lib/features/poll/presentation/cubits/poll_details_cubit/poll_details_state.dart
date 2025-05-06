part of 'poll_details_cubit.dart';


class PollDetailsErrorState extends PollDetailsState {
  final String? message;

  PollDetailsErrorState({this.message});
}

final class PollDetailsInitialState extends PollDetailsState {}

final class PollDetailsLoadingState extends PollDetailsState {}

final class PollDetailsReadyState extends PollDetailsState {
  PollDetailsReadyState(this.response);
    BaseEntity<PollDetailsEntity> response;

}

abstract class PollDetailsState {}
