import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/features/insurance/domain/entities/insurance_programs.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../repositories/insurance_repository.dart";

@injectable
class GetInsuranceUseCase
    implements UseCaseNoParam<BaseEntity<List<InsuranceProgramsEntity>>> {
  GetInsuranceUseCase({required this.insuranceRepository});

  final InsuranceRepository insuranceRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<InsuranceProgramsEntity>>>> call() {
    return insuranceRepository.getInsurancePrograms();
  }
}
