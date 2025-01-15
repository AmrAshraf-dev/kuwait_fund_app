import 'package:equatable/equatable.dart';

class BeneficiaryEntity extends Equatable {
  final String beneficiaryName;
  final String civilId;
  final String relationshipWithBeneficiary;

  const BeneficiaryEntity({
    required this.beneficiaryName,
    required this.civilId,
    required this.relationshipWithBeneficiary,
  });

  @override
  List<Object?> get props => [
        beneficiaryName,
        civilId,
        relationshipWithBeneficiary,
      ];
}
