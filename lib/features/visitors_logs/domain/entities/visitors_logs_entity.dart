import "package:equatable/equatable.dart";

/// Entity that contains the data of the VisitorsLogs.
class VisitorsLogsEntity extends Equatable {
  final String? date;

  final String? visitType;

  /// Entity that contains the data of the VisitorsLogs.
  VisitorsLogsEntity({required this.date, required this.visitType});

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        /*
  List your entity attributes here 
  */
      ];
}

class VisitorLogsHostsEntity extends Equatable {
  final String? name;

  VisitorLogsHostsEntity({required this.name});

  @override
  List<Object?> get props => [];
}

class VisitorsManagementCalendarEntity extends Equatable {
  final String? date;
  final String? visitType;

  VisitorsManagementCalendarEntity({this.date, this.visitType});

  @override
  List<Object?> get props => [];
}
