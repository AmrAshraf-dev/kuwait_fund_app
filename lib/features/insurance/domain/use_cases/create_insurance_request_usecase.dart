import 'package:injectable/injectable.dart';
import '../../data/models/request/create_insurance_request_model.dart';
import '../entities/insurance_entity.dart';

import "../../../../core/domain/usecase/base_usecase.dart";
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import "../repositories/insurance_repository.dart";

@injectable
class CreateInsuranceRequestUseCase
    implements
        UseCase<BaseEntity<InsuranceEntity>, CreateInsuranceRequestModel> {
  CreateInsuranceRequestUseCase({required this.insuranceRepository});

  final InsuranceRepository insuranceRepository;

  @override
  Future<CustomResponseType<BaseEntity<InsuranceEntity>>> call(
      insuranceRequestModel) {
    return insuranceRepository.createInsuranceRequest(
        insuranceRequestModel: insuranceRequestModel);
  }
}
