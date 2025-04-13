import "package:equatable/equatable.dart";

/// Entity that contains the data of the CreateRequest.
class CreateSickLeaveEntity extends Equatable {
  final String? fileExtention;

  final String? bytes;

  /// Entity that contains the data of the CreateRequest.
  const CreateSickLeaveEntity({
    required this.fileExtention,
    required this.bytes,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        fileExtention,
        bytes,
      ];
}
