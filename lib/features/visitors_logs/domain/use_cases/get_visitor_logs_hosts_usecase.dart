import 'package:injectable/injectable.dart';
import 'package:kf_ess_mobile_app/core/domain/usecase/base_usecase.dart';
import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitor_logs_hosts_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitors_logs_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/repositories/visitor_logs_hosts_repository.dart';

@injectable
class GetVisitorLogsHostsUseCase
    implements
        UseCase<BaseEntity<List<VisitorLogsHostsEntity>>,
            List<VisitorLogsHostsModel>> {
  GetVisitorLogsHostsUseCase({required this.visitorsLogsHostsRepository});

  final VisitorLogsHostsRepository visitorsLogsHostsRepository;

  @override
  Future<CustomResponseType<BaseEntity<List<VisitorLogsHostsEntity>>>> call(
    List<VisitorLogsHostsModel> params,
  ) {
    return visitorsLogsHostsRepository.getVisitorLogsHosts(
        visitorsLogsHostsParams: params);
  }
}
