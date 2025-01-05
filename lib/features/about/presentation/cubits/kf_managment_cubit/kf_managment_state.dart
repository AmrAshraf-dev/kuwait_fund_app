part of 'kf_managment_cubit.dart';

class KFManagmentErrorState extends KFManagmentState {
  final String? message;

  KFManagmentErrorState({this.message});
}

final class KFManagmentInitialState extends KFManagmentState {}

final class KFManagmentLoadingState extends KFManagmentState {}

final class KFManagmentReadyState extends KFManagmentState {
  KFManagmentReadyState(this.response);
  BaseEntity<List<KFManagmentEntity>> response;
}

abstract class KFManagmentState {}
