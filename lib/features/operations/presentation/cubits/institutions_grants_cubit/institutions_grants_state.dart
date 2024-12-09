part of 'institutions_grants_cubit.dart';

class InstitutionsGrantsErrorState extends InstitutionsGrantsState {
  final String? message;

  InstitutionsGrantsErrorState({this.message});
}

final class InstitutionsGrantsInitialState extends InstitutionsGrantsState {}

final class InstitutionsGrantsLoadingState extends InstitutionsGrantsState {}

final class InstitutionsGrantsReadyState extends InstitutionsGrantsState {
  InstitutionsGrantsReadyState(this.response);
  BaseEntity<List<InstitutionGrantsEntity>> response;
}

abstract class InstitutionsGrantsState {}
