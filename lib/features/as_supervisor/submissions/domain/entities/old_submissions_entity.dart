import "package:equatable/equatable.dart";

/// Entity that contains the data of the Submissions.
class OldSubmissionsEntity extends Equatable {
  final String? requestID;
  final String? requestType;
  final String? statusCode;
  final String? requestDate;
  final String? startDate;
  final String? endDate;
  final String? courseName;
  final String? loanReason;
  final String? loanAmount;

  /// Entity that contains the data of the Submissions.
  const OldSubmissionsEntity({
    required this.requestID,
    required this.requestType,
    required this.statusCode,
    required this.requestDate,
    required this.startDate,
    required this.endDate,
    required this.courseName,
    required this.loanReason,
    required this.loanAmount,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        requestID,
        requestType,
        statusCode,
        requestDate,
        startDate,
        endDate,
        courseName,
        loanReason,
        loanAmount,
      ];
}
