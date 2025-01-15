import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/beneficiary_entity.dart';

part 'beneficiary_state.dart';

@injectable
class BeneficiaryCubit extends Cubit<BeneficiaryState> {
  BeneficiaryCubit() : super(BeneficiaryInitialState());

  // List to store beneficiaries
  List<BeneficiaryEntity> beneficiaries = [];

  // Method to add a beneficiary
  void addBeneficiary(String name, String civilId, String relationship) {
    beneficiaries.add(BeneficiaryEntity(
        beneficiaryName: name,
        civilId: civilId,
        relationshipWithBeneficiary: relationship));
    // Emit the updated state
    emit(BeneficiaryAddedState(beneficiaries));
  }

  // Method to remove a beneficiary
  void removeBeneficiary(int index) {
    beneficiaries.removeAt(index);
    // Emit the updated state
    emit(BeneficiaryAddedState(beneficiaries));
  }
}
