import "package:equatable/equatable.dart";

/// Entity that contains the data of the Insurance.
class InsuranceEntity extends Equatable {
  final String? insuranceCompanyID;
  final String? insurenceStatus;
  final bool? isMedicallySubscribed;
  final bool? hasMedicalRequest;
  final bool? viewCancelButton;
  final bool? isAllowedTosubscribe;
  final String? employeeName;
  final String? insuranceCompanyName;
  final String? noOfPersons;
  final String? startDate;
  final String? programSubscribed;
  final String? beneficiaries;

  /// Entity that contains the data of the Insurance.
  const InsuranceEntity({
    required this.employeeName,
    required this.insuranceCompanyName,
    required this.noOfPersons,
    required this.startDate,
    required this.programSubscribed,
    required this.beneficiaries,
    this.insuranceCompanyID,
    this.insurenceStatus,
    this.isMedicallySubscribed,
    this.hasMedicalRequest,
    this.viewCancelButton,
    this.isAllowedTosubscribe,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        employeeName,
        insuranceCompanyName,
        noOfPersons,
        startDate,
        programSubscribed,
        beneficiaries,
      ];
}
