import "package:equatable/equatable.dart";

/// Entity that contains the data of the CreateRequest.
class PersonalLoanReasonEntity extends Equatable {
  final String? id;

  final String? name;

  /// Entity that contains the data of the CreateRequest.
  const PersonalLoanReasonEntity({
    required this.id,
    required this.name,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        id,
      ];
}
