import "package:equatable/equatable.dart";

/// Entity that contains the data of the Insurance.
class InsuranceEntity extends Equatable {
  final String? id;
  final String? programName;
  final String? employeeName;
  final String? insuranceCompanyName;
  final String? insuranceCompany;
  final String? statusLabel;
  final String? noOfPersons;
  final String? startDate;
  final String? deleteNotes;
  final String? programSubscribed;
  final String? viewButtons;
  final String? beneficiaries;

  /// Entity that contains the data of the Insurance.
  const InsuranceEntity({
    required this.id,
    required this.programName,
    required this.employeeName,
    required this.insuranceCompanyName,
    required this.insuranceCompany,
    required this.statusLabel,
    required this.noOfPersons,
    required this.startDate,
    required this.deleteNotes,
    required this.programSubscribed,
    required this.viewButtons,
    required this.beneficiaries,
  });

  /*
  An entity represents a real-world object with a distinct identity. 
  */

  @override
  List<Object?> get props => [
        id,
        programName,
        employeeName,
        insuranceCompanyName,
        insuranceCompany,
        statusLabel,
        noOfPersons,
        startDate,
        deleteNotes,
        programSubscribed,
        viewButtons,
        beneficiaries,
      ];
}
