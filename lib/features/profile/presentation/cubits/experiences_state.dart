
part of 'experiences_cubit.dart';


class ExperiencesErrorState extends ExperiencesState {
  final String? message;

  ExperiencesErrorState({this.message});
}

final class ExperiencesInitialState extends ExperiencesState {}

final class ExperiencesLoadingState extends ExperiencesState {}

final class ExperiencesEmptyState extends ExperiencesState {}

final class ExperiencesReadyState extends ExperiencesState {
  ExperiencesReadyState(this.response);
  BaseEntity<List<ExperiencesModel>> response;
}

abstract class ExperiencesState {}
