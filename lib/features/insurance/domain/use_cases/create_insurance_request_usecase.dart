import 'package:injectable/injectable.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../entities/insurance_entity.dart";
import "../repositories/insurance_repository.dart";

@injectable
class CreateInsuranceRequestUseCase
    implements UseCaseNoParam<BaseEntity<List<InsuranceEntity>>> {
  CreateInsuranceRequestUseCase({required this.insuranceRepository});

  final InsuranceRepository insuranceRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<InsuranceEntity>>>> call() {
    return insuranceRepository.getInsurancePrograms();
  }
}
