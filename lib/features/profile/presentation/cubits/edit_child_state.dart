part of 'edit_child_cubit.dart';

class EditChildErrorState extends EditChildState {
  final String? message;

  EditChildErrorState({this.message});
}

final class EditChildInitialState extends EditChildState {}

final class EditChildLoadingState extends EditChildState {}

final class EditChildReadyState extends EditChildState {
  EditChildReadyState(this.response);
  BaseEntity<String> response;
}

abstract class EditChildState {}
