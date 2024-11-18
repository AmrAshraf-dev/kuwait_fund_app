import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/visitors_logs_request_model.dart";
import "../entities/visitors_logs_entity.dart";
import "../repositories/visitors_logs_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';




@injectable
class GetVisitorsLogsUseCase implements UseCase<BaseEntity<VisitorsLogsEntity>, VisitorsLogsRequestModel> {
    GetVisitorsLogsUseCase ({required this.visitorsLogsRepository});

  final VisitorsLogsRepository visitorsLogsRepository;


  @override
  Future<CustomResponseType<BaseEntity<VisitorsLogsEntity>>> call(
    VisitorsLogsRequestModel params,
  ) {
    
    
    return visitorsLogsRepository.getVisitorsLogs(visitorsLogsParams: params);
    
  }
}
