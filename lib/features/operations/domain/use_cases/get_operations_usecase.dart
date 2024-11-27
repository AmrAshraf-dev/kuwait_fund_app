import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/operations_request_model.dart";
import "../entities/operations_entity.dart";
import "../repositories/operations_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetOperationsUseCase implements UseCase<BaseEntity<OperationsEntity>, OperationsRequestModel> {
    GetOperationsUseCase ({required this.operationsRepository});

  final OperationsRepository operationsRepository;


  @override
  Future<CustomResponseType<BaseEntity<OperationsEntity>>> call(
    OperationsRequestModel params,
  ) {
    
    
    return operationsRepository.getOperations(operationsParams: params);
    
  }
}
