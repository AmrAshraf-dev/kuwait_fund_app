import 'package:injectable/injectable.dart';
import '../../../../core/domain/usecase/base_usecase.dart';
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../entities/visitor_logs_hosts_entity.dart';
import '../repositories/visitors_logs_repository.dart';

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
