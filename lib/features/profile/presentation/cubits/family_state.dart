part of 'family_cubit.dart';

class FamilyErrorState extends FamilyState {
  final String? message;

  FamilyErrorState({this.message});
}

final class FamilyInitialState extends FamilyState {}

final class FamilyLoadingState extends FamilyState {}

final class FamilyEmptyState extends FamilyState {}

final class FamilyReadyState extends FamilyState {
  FamilyReadyState(this.response);
  BaseEntity<List<FamilyEntity>> response;
}

abstract class FamilyState {}
