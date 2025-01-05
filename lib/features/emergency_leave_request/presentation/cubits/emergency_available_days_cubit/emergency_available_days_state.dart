part of 'emergency_available_days_cubit.dart';

class EmergencyAvailableDaysErrorState extends EmergencyAvailableDaysState {
  final String? message;

  EmergencyAvailableDaysErrorState({this.message});
}

final class EmergencyAvailableDaysInitialState
    extends EmergencyAvailableDaysState {}

final class EmergencyAvailableDaysLoadingState
    extends EmergencyAvailableDaysState {}

final class EmergencyAvailableDaysReadyState
    extends EmergencyAvailableDaysState {
  EmergencyAvailableDaysReadyState(this.response);
  BaseEntity<dynamic> response;
}

abstract class EmergencyAvailableDaysState {}
