import "package:equatable/equatable.dart";

/// Entity that contains the data of the Requests.
class AnnualLeaveDetailsEntity extends Equatable {
  final String? leaveRequestId;
  final String? requestDate;
  final String? requestType;
  final String? leaveStatus;
  final String? leaveStatusCode;
  final String? startDate;
  final String? endDate;
  final String? supervisionName;
  final String? approvalDate;

  /// Entity that contains the data of the Requests.
  const AnnualLeaveDetailsEntity({
    required this.leaveRequestId,
    required this.requestDate,
    required this.requestType,
    required this.leaveStatus,
    required this.leaveStatusCode,
    required this.startDate,
    required this.endDate,
    required this.supervisionName,
    required this.approvalDate,
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
