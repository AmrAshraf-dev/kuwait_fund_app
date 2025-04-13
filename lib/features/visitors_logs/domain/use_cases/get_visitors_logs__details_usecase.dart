  import "package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitors_logs_details_request_model.dart";
import "package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_details_entity.dart";
  
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

 