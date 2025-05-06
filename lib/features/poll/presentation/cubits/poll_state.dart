part of 'poll_cubit.dart';

class PollErrorState extends PollState {
  final String? message;

  PollErrorState({this.message});
}

final class PollInitialState extends PollState {}

final class PollLoadingState extends PollState {}

final class PollReadyState extends PollState {
  PollReadyState(this.response);
    BaseEntity<PollEntity> response;

}

abstract class PollState {}
