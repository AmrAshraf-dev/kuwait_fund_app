import "package:equatable/equatable.dart";

/// Entity that contains the data of the Submissions.
class SubmissionsEntity extends Equatable {
  final String? status;
  final String? date;
  final String? type;
  final String? from;
  final String? to;
  final String? requesterName;

  /// Entity that contains the data of the Submissions.
  const SubmissionsEntity({
    required this.status,
    required this.date,
    required this.type,
    required this.from,
    required this.to,
    required this.requesterName,
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
