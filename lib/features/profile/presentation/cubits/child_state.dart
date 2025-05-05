part of 'child_cubit.dart';

class ChildErrorState extends ChildState {
  final String? message;

  ChildErrorState({this.message});
}

final class ChildInitialState extends ChildState {}

final class ChildLoadingState extends ChildState {}

final class ChildReadyState extends ChildState {
  ChildReadyState(this.response);
  BaseEntity<ChildEntity> response;
}
final class EditChildReadyState extends ChildState {
  EditChildReadyState(this.response);
  BaseEntity<String> response;
}


final class ChildDisabilityTypesReadyState extends ChildState {
  ChildDisabilityTypesReadyState(this.response);
  BaseEntity<List<LookUpEntity>> response;
}

abstract class ChildState {}
