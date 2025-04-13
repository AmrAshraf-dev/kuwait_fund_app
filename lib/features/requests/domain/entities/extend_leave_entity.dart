import "package:equatable/equatable.dart";

/// Entity that contains the data of the CreateRequest.
class CreateExtendLeaveEntity extends Equatable {
  final String? leaveRequestId;

  final String? extendDate;

  /// Entity that contains the data of the CreateRequest.
  const CreateExtendLeaveEntity({
    required this.leaveRequestId,
    required this.extendDate,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        leaveRequestId,
        extendDate,
      ];
}
