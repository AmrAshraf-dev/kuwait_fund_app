import 'package:kf_ess_mobile_app/core/network/base_handling.dart';
import 'package:kf_ess_mobile_app/features/shared/entity/base_entity.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/request/visitor_logs_hosts_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitors_logs_entity.dart';

abstract class VisitorLogsHostsRepository {
  Future<CustomResponseType<BaseEntity<List<VisitorLogsHostsEntity>>>>
      getVisitorLogsHosts(
          {required List<VisitorLogsHostsModel> visitorsLogsHostsParams});
}
