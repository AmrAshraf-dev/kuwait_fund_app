part of 'qualifications_cubit.dart';


class QualificationsErrorState extends QualificationsState {
  final String? message;

  QualificationsErrorState({this.message});
}

final class QualificationsInitialState extends QualificationsState {}

final class QualificationsLoadingState extends QualificationsState {}

final class QualificationsEmptyState extends QualificationsState {}

final class QualificationsReadyState extends QualificationsState {
  QualificationsReadyState(this.response);
  BaseEntity<List<QualificationsModel>> response;
}

abstract class QualificationsState {}
