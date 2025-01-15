part of 'submissions_cubit.dart';

class SubmissionsErrorState extends SubmissionsState {
  final String? message;

  SubmissionsErrorState({this.message});
}

final class SubmissionsInitialState extends SubmissionsState {}

final class SubmissionsLoadingState extends SubmissionsState {}

final class SubmissionsEmptyState extends SubmissionsState {}

final class SubmissionsReadyState extends SubmissionsState {
  SubmissionsReadyState(this.response);
  BaseEntity<List<SubmissionsEntity>> response;
}

abstract class SubmissionsState {}
