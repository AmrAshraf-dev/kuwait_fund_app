import "package:equatable/equatable.dart";

/// Entity that contains the data of the Submission.
class SubmissionEntity extends Equatable {
  final String? id;
  final String? empLoginName;
  final String? mobile;
  final String? createDate;
  final String? leaveType;
  final String? leaveStatus;
  final String? startDate;
  final String? endDate;

  /// Entity that contains the data of the Submission.
  const SubmissionEntity({
    required this.id,
    required this.empLoginName,
    required this.mobile,
    required this.createDate,
    required this.leaveType,
    required this.leaveStatus,
    required this.startDate,
    required this.endDate,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        id,
        empLoginName,
        mobile,
        createDate,
        leaveType,
        leaveStatus,
        startDate,
        endDate,
      ];
}
