import "package:equatable/equatable.dart";

/// Entity that contains the data of the CreateRequest.
class CreateDeleteLeaveEntity extends Equatable {
  final int? leaveRequestId;

  /// Entity that contains the data of the CreateRequest.
  const CreateDeleteLeaveEntity({
    required this.leaveRequestId,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        leaveRequestId,
      ];
}
