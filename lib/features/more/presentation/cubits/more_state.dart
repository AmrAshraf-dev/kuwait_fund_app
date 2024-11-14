part of 'more_cubit.dart';

class MoreErrorState extends MoreState {
  final String? message;

  MoreErrorState({this.message});
}

final class MoreInitialState extends MoreState {}

final class MoreLoadingState extends MoreState {}

final class MoreReadyState extends MoreState {
  MoreReadyState(this.response);
    BaseEntity<MoreEntity> response;

}

abstract class MoreState {}
