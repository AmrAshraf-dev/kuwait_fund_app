import "../../data/models/request/visitors_logs_details_request_model.dart";
import "../entities/visitor_logs_details_entity.dart";
  
import "../../../../core/domain/usecase/base_usecase.dart";
  import "../repositories/visitors_logs_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetVisitorsLogsDetailsUseCase
    implements
        UseCase<BaseEntity<List<VisitorsLogsDetailsEntity>>,
            VisitorsLogsDetailsRequestModel> {
  GetVisitorsLogsDetailsUseCase({required this.visitorsLogsRepository});

  final VisitorsLogsRepository visitorsLogsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<VisitorsLogsDetailsEntity>>>> call(
    VisitorsLogsDetailsRequestModel params,
  ) {
    return visitorsLogsRepository.getVisitorsLogsDetails(visitorsLogsDetailsParams: params);
  }
}

 