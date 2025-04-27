/// Entity that contains the data of the Home.
class HomeEntity {


  final String? leaveRequestID;
  final String? arabicSupervisorName;
  final String? leaveStatus;
  final String? leaveStatusCode;
  final DateTime? requestDate;
  final String? leaveType;
  final DateTime? requestStartDate;
  final DateTime? requestEndDate;
  final DateTime? requestExtendDate;
  final String? annualLeaveBalance;
  final String? shortSickDays;
  final String? leavDaysTaken;
  final String? leaveRequestsCount;
  final String? emergencyBalance;
  final String? availableExceseBalance;
  final String? tolalExecese;
  final String? lateBalance;
  final String? emergencyTransffered;

  /// Entity that contains the data of the Home.
  HomeEntity({

    this.leaveRequestID,
    this.arabicSupervisorName,
    this.leaveStatus,
    this.leaveStatusCode,
    this.requestDate,
    this.leaveType,
    this.requestStartDate,
    this.requestEndDate,
    this.requestExtendDate,
    this.annualLeaveBalance,
    this.shortSickDays,
    this.leavDaysTaken,
    this.leaveRequestsCount,
    this.emergencyBalance,
    this.availableExceseBalance,
    this.tolalExecese,
    this.lateBalance,
    this.emergencyTransffered,
  });
}