part of 'visitors_logs_cubit.dart';

class VisitorsLogsErrorState extends VisitorsLogsState {
  final String? message;

  VisitorsLogsErrorState({this.message});
}

final class VisitorsLogsInitialState extends VisitorsLogsState {}

final class VisitorsLogsLoadingState extends VisitorsLogsState {}

final class VisitorsLogsReadyState extends VisitorsLogsState {
  VisitorsLogsReadyState(this.response);
  BaseEntity<List<VisitorsLogsEntity>> response;
}

final class VisitorsLogsHostsReadyState extends VisitorsLogsState {
  VisitorsLogsHostsReadyState(this.response);

  BaseEntity<List<VisitorLogsHostsEntity>> response;
}

final class VisitorsManagementCalendarReadyState extends VisitorsLogsState {
  VisitorsManagementCalendarReadyState(this.response);

  List<VisitorsManagementCalendarEntity> response;
}

abstract class VisitorsLogsState {}
