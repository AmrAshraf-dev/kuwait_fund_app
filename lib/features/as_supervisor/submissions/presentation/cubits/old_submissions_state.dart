part of 'old_submissions_cubit.dart';

class OldSubmissionsErrorState extends OldSubmissionsState {
  final String? message;

  OldSubmissionsErrorState({this.message});
}

final class OldSubmissionsInitialState extends OldSubmissionsState {}

final class OldSubmissionsLoadingState extends OldSubmissionsState {}

final class OldSubmissionsEmptyState extends OldSubmissionsState {}

final class OldSubmissionsReadyState extends OldSubmissionsState {
  OldSubmissionsReadyState(this.response);
  BaseEntity<List<OldSubmissionsEntity>> response;
}

abstract class OldSubmissionsState {}
