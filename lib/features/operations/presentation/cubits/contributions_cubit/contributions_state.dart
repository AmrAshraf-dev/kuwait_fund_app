part of 'contributions_cubit.dart';

class ContributionsErrorState extends ContributionsState {
  final String? message;

  ContributionsErrorState({this.message});
}

final class ContributionsInitialState extends ContributionsState {}

final class ContributionsLoadingState extends ContributionsState {}

final class ContributionsReadyState extends ContributionsState {
  ContributionsReadyState(this.response);
  BaseEntity<List<ContributionEntity>> response;
}

abstract class ContributionsState {}
