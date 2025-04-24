part of 'edit_spouse_cubit.dart';

class EditSpouseErrorState extends EditSpouseState {
  final String? message;

  EditSpouseErrorState({this.message});
}

final class EditSpouseInitialState extends EditSpouseState {}

final class EditSpouseLoadingState extends EditSpouseState {}

final class EditSpouseReadyState extends EditSpouseState {
  EditSpouseReadyState(this.response);
  BaseEntity<String> response;
}

abstract class EditSpouseState {}
