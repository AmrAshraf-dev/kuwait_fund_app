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

  BaseEntity<List<VisitorsLogsHostsEntity>> response;
}

final class VisitorsManagementCalendarReadyState extends VisitorsLogsState {
  VisitorsManagementCalendarReadyState(this.response);

  List<VisitorsLogsHostsEntity> response;
}


final class VisitorsLogsCanViewState extends VisitorsLogsState {
  VisitorsLogsCanViewState( );
 
}

final class VisitorsLogsDetailsReadyState extends VisitorsLogsState {
  VisitorsLogsDetailsReadyState(this.response);
  BaseEntity<List<VisitorsLogsDetailsEntity>> response;
}

final class VisitorsLogsCanNotViewState extends VisitorsLogsState {
  
  VisitorsLogsCanNotViewState();
}
abstract class VisitorsLogsState {}
