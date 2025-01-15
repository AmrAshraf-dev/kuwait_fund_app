import "package:equatable/equatable.dart";

/// Entity that contains the data of the CreateRequest.
class PersonalLoanReasonEntity extends Equatable {
  final String? code;

  final String? reson;

  /// Entity that contains the data of the CreateRequest.
  const PersonalLoanReasonEntity({
    required this.code,
    required this.reson,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        code,
        reson,
      ];
}
