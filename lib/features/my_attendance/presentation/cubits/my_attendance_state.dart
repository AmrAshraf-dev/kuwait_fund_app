part of 'my_attendance_cubit.dart';

class MyAttendanceErrorState extends MyAttendanceState {
  final String? message;

  MyAttendanceErrorState({this.message});
}

final class MyAttendanceInitialState extends MyAttendanceState {}

final class MyAttendanceLoadingState extends MyAttendanceState {}

final class MyAttendanceReadyState extends MyAttendanceState {
  MyAttendanceReadyState(this.response);
    BaseEntity<MyAttendanceEntity> response;

}

abstract class MyAttendanceState {}
