import "package:equatable/equatable.dart";

/// Entity that contains the data of the Requests.
class RequestsEntity extends Equatable {
  final String? requestID;
  final String? requestTypeID;
  final String? requestDate;
  final String? requestStatus;
  final String? requestTitle;
  final String? details;

  /// Entity that contains the data of the Requests.
  const RequestsEntity({
    required this.requestID,
    required this.requestTypeID,
    required this.requestStatus,
    required this.requestDate,
    required this.requestTitle,
    required this.details,
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
