import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
 import 'package:kf_ess_mobile_app/features/visitors_logs/domain/repositories/visitors_logs_repository.dart';

@injectable
class GetVisitorLogsHostsUseCase
    implements
        UseCase<BaseEntity<List<VisitorsLogsHostsEntity>>,
            String> {
  GetVisitorLogsHostsUseCase({required this.visitorsLogsRepository});

  final VisitorsLogsRepository visitorsLogsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<VisitorsLogsHostsEntity>>>> call(
    String params,
  ) {
    return visitorsLogsRepository.getVisitorLogsHosts(
        date: params);
  }
}
