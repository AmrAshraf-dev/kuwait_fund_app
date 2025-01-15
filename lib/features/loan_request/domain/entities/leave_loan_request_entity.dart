import "package:equatable/equatable.dart";

/// Entity that contains the data of the CreateRequest.
class CreateLoanRequestEntity extends Equatable {
  final String? userName;

  final String? applicationDate;

  final String? reason;

  final String? reasonRemarks;

  final String? loanAmount;

  final String? noOfInstalments;

  /// Entity that contains the data of the CreateRequest.
  const CreateLoanRequestEntity(
      {required this.userName,
      required this.applicationDate,
      required this.reason,
      required this.reasonRemarks,
      required this.loanAmount,
      required this.noOfInstalments});

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        userName,
        applicationDate,
        reason,
        reasonRemarks,
        loanAmount,
        noOfInstalments
      ];
}
