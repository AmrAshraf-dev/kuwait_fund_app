import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/insurance_request_model.dart";
import "../entities/insurance_entity.dart";
import "../repositories/insurance_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetInsuranceUseCase implements UseCase<BaseEntity<InsuranceEntity>, InsuranceRequestModel> {
    GetInsuranceUseCase ({required this.insuranceRepository});

  final InsuranceRepository insuranceRepository;


  @override
  Future<CustomResponseType<BaseEntity<InsuranceEntity>>> call(
    InsuranceRequestModel params,
  ) {
    
    
    return insuranceRepository.getInsurance(insuranceParams: params);
    
  }
}
