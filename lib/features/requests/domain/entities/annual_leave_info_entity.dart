import "package:equatable/equatable.dart";

/// Entity that contains the data of the Requests.
class AnnualLeaveInfoEntity extends Equatable {
  final String? leaveStatus;
  final String? leaveStatusCode;
  final String? leaveType;
  final String? requestDate;
  final String? leaveStartDate;
  final String? leaveEndDate;

  /// Entity that contains the data of the Requests.
  const AnnualLeaveInfoEntity({
    required this.leaveStatus,
    required this.leaveStatusCode,
    required this.leaveType,
    required this.requestDate,
    required this.leaveStartDate,
    required this.leaveEndDate,
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
