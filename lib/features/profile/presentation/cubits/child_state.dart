part of 'child_cubit.dart';

class ChildErrorState extends ChildState {
  final String? message;

  ChildErrorState({this.message});
}

final class ChildInitialState extends ChildState {}

final class ChildLoadingState extends ChildState {}

final class ChildReadyState extends ChildState {
  ChildReadyState(this.response);
  BaseEntity<ChildModel> response;
}

abstract class ChildState {}
