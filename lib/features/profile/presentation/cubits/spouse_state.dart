part of 'spouse_cubit.dart';

class SpouseErrorState extends SpouseState {
  final String? message;

  SpouseErrorState({this.message});
}

final class SpouseInitialState extends SpouseState {}

final class SpouseLoadingState extends SpouseState {}

final class SpouseReadyState extends SpouseState {
  SpouseReadyState(this.response);
  BaseEntity<SpouseEntity> response;
}

final class EditSpouseReadyState extends SpouseState {
  EditSpouseReadyState(this.response);
  BaseEntity<String> response;
}

final class SpouseStatusReadyState extends SpouseState {
  SpouseStatusReadyState(this.response);
  BaseEntity<List<LookUpEntity>> response;
}
 


abstract class SpouseState {}
