part of 'countries_grants_cubit.dart';

class CountriesGrantsErrorState extends CountriesGrantsState {
  final String? message;

  CountriesGrantsErrorState({this.message});
}

final class CountriesGrantsInitialState extends CountriesGrantsState {}

final class CountriesGrantsLoadingState extends CountriesGrantsState {}

final class CountriesGrantsReadyState extends CountriesGrantsState {
  CountriesGrantsReadyState(this.response);
  BaseEntity<List<CountryGrantsEntity>> response;
}

abstract class CountriesGrantsState {}
