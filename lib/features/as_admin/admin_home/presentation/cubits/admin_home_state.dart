part of 'admin_home_cubit.dart';

class AdminHomeErrorState extends AdminHomeState {
  final String? message;

  AdminHomeErrorState({this.message});
}

final class AdminHomeInitialState extends AdminHomeState {}

final class AdminHomeLoadingState extends AdminHomeState {}

final class AdminHomeReadyState extends AdminHomeState {
  AdminHomeReadyState(this.response);
    BaseEntity<AdminHomeEntity> response;

}

abstract class AdminHomeState {}
