part of 'beneficiary_cubit.dart';

abstract class BeneficiaryState {
  const BeneficiaryState();
}

class BeneficiaryInitialState extends BeneficiaryState {}

class BeneficiaryAddedState extends BeneficiaryState {
  final List<BeneficiaryEntity> beneficiaryList;

  const BeneficiaryAddedState(this.beneficiaryList);
}
