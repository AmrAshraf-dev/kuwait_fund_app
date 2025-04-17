import "package:equatable/equatable.dart";

/// Entity that contains the data of the Requests.
class RequestsEntity extends Equatable {
  final String? leaveID;
  final String? requestDate;
  final String? leaveStatus;
  final String? leaveStartDate;
  final String? leaveEndDate;
  final String? leaveType;
  final String? leaveExtendDate;
  final bool? leaveExtendedFlag;
  final bool? showExtendButton;
  final bool? showCancelButton;

  /// Entity that contains the data of the Requests.
  const RequestsEntity({
    required this.leaveID,
    required this.requestDate,
    required this.leaveStatus,
    required this.leaveStartDate,
    required this.leaveEndDate,
    required this.leaveType,
    required this.leaveExtendDate,
    required this.leaveExtendedFlag,
    required this.showExtendButton,
    required this.showCancelButton,
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
