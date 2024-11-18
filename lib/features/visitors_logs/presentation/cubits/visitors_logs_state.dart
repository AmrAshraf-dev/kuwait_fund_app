part of 'visitors_logs_cubit.dart';

class VisitorsLogsErrorState extends VisitorsLogsState {
  final String? message;

  VisitorsLogsErrorState({this.message});
}

final class VisitorsLogsInitialState extends VisitorsLogsState {}

final class VisitorsLogsLoadingState extends VisitorsLogsState {}

final class VisitorsLogsReadyState extends VisitorsLogsState {
  VisitorsLogsReadyState(this.response);
    BaseEntity<VisitorsLogsEntity> response;

}

abstract class VisitorsLogsState {}
