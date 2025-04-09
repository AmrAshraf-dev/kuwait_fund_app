import "package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_management_calendar_model.dart";
import "package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_entity.dart";
import "package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart";

import "../../../../core/domain/usecase/base_usecase.dart";
import "../../data/models/request/visitors_logs_request_model.dart";
 import "../repositories/visitors_logs_repository.dart";

import 'package:injectable/injectable.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../../core/network/base_handling.dart';

@injectable
class GetVisitorsLogsUseCase
    implements
        UseCase<BaseEntity<List<VisitorsLogsEntity>>,
            VisitorsLogsRequestModel> {
  GetVisitorsLogsUseCase({required this.visitorsLogsRepository});

  final VisitorsLogsRepository visitorsLogsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<VisitorsLogsEntity>>>> call(
    VisitorsLogsRequestModel params,
  ) {
    return visitorsLogsRepository.getVisitorsLogs(visitorsLogsParams: params);
  }
}

@injectable
class GetVisitorLogsUseCase
    implements
        UseCase<BaseEntity<List<VisitorsLogsEntity>>,VisitorsLogsRequestModel > {
  GetVisitorLogsUseCase(this.visitorsLogsRepository);
  final VisitorsLogsRepository visitorsLogsRepository;
  @override
  Future<CustomResponseType<BaseEntity<List<VisitorsLogsEntity>>>> call(
    VisitorsLogsRequestModel params,
  ) async {
    return visitorsLogsRepository.getVisitorsLogs(
         visitorsLogsParams: params);
  }
}
