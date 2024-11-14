part of 'notifications_cubit.dart';

class NotificationsErrorState extends NotificationsState {
  final String? message;

  NotificationsErrorState({this.message});
}

final class NotificationsInitialState extends NotificationsState {}

final class NotificationsLoadingState extends NotificationsState {}

final class NotificationsReadyState extends NotificationsState {
  NotificationsReadyState(this.response);
    BaseEntity<NotificationsEntity> response;

}

abstract class NotificationsState {}
