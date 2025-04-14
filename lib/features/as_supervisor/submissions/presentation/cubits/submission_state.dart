part of 'submission_cubit.dart';

class SubmissionErrorState extends SubmissionState {
  final String? message;

  SubmissionErrorState({this.message});
}

final class SubmissionInitialState extends SubmissionState {}

final class SubmissionLoadingState extends SubmissionState {}

final class SubmissionEmptyState extends SubmissionState {}

final class SubmissionReadyState extends SubmissionState {
  SubmissionReadyState(this.response);
  BaseEntity<List<SubmissionEntity>> response;
}

abstract class SubmissionState {}
