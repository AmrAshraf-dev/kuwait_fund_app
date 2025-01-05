import "package:equatable/equatable.dart";

/// Entity that contains the data of the Requests.
class RequestsEntity extends Equatable {
  final String? requestID;
  final String? requestType;
  final String? status;
  final String? statusCode;
  final DateTime? requestDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? courseName;
  final String? loanReason;
  final String? loanAmount;

  /// Entity that contains the data of the Requests.
  const RequestsEntity({
    required this.requestID,
    required this.requestType,
    required this.status,
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
        /*
  List your entity attributes here 
  */
      ];
}
