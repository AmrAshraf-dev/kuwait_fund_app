import "package:equatable/equatable.dart";

/// Entity that contains the data of the Requests.
class AnnualLeaveInfoEntity extends Equatable {
  final String? leaveRequestId;
  final String? arabicSupervisorName;
  final String? englishSupervisorName;
  final String? englishLeaveStatus;
  final String? arabicLeaveStatus;
  final String? leaveStatusCode;
  final String? requestDate;
  final String? leaveTypeArabic;
  final String? leaveTypeEnglish;
  final String? requestStartDate;
  final String? requestEndDate;
  final String? leaveId;
  final String? leaveStartDate;
  final String? leaveEndDate;
  final String? requestExtendDate;
  final String? extended_flg;
  final String? showExtendButton;
  final String? showCancelButton;
  final String? leaveBalance;
  final String? shortSickDays;
  final String? leavDaysTaken;
  final String? leaveRequestsCount;
  final String? emergencyBalance;
  final String? availableExceseBalance;
  final String? tolalExecese;
  final String? lateBalance;
  final String? emergencyTransffered;
  final String? requestTypeEnglish;
  final String? requestTypeArabic;

//
  /// Entity that contains the data of the Requests.
  const AnnualLeaveInfoEntity({
    required this.leaveRequestId,
    required this.arabicSupervisorName,
    required this.englishSupervisorName,
    required this.englishLeaveStatus,
    required this.arabicLeaveStatus,
    required this.leaveStatusCode,
    required this.requestDate,
    required this.leaveTypeArabic,
    required this.leaveTypeEnglish,
    required this.requestStartDate,
    required this.requestEndDate,
    required this.leaveId,
    required this.leaveStartDate,
    required this.leaveEndDate,
    required this.requestExtendDate,
    required this.extended_flg,
    required this.showExtendButton,
    required this.showCancelButton,
    required this.leaveBalance,
    required this.shortSickDays,
    required this.leavDaysTaken,
    required this.leaveRequestsCount,
    required this.emergencyBalance,
    required this.availableExceseBalance,
    required this.tolalExecese,
    required this.lateBalance,
    required this.emergencyTransffered,
    required this.requestTypeEnglish,
    required this.requestTypeArabic,
  });

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
