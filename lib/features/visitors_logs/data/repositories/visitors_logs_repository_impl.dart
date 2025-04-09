// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:injectable/injectable.dart';

 import 'package:kf_ess_mobile_app/features/visitors_logs/data/models/response/visitors_management_calendar_model.dart';
import 'package:kf_ess_mobile_app/features/visitors_logs/domain/entities/visitor_logs_hosts_entity.dart';
 
import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../../visitors_logs/data/data_sources/remote/visitors_logs_remote_data_source.dart';
import '../../domain/repositories/visitors_logs_repository.dart';
import '../models/request/visitors_logs_request_model.dart';
import '../models/response/visitors_logs_response_model.dart';

@Injectable(as: VisitorsLogsRepository)
class VisitorsLogsRepositoryImp implements VisitorsLogsRepository {
  VisitorsLogsRepositoryImp({
    required this.visitorsLogsRemoteDataSource,
  });

  final VisitorsLogsRemoteDataSource visitorsLogsRemoteDataSource;
  @override
  Future<CustomResponseType<BaseEntity<List<VisitorsLogsModel>>>> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsParams}) async {
    return await visitorsLogsRemoteDataSource.getVisitorsLogs(
        visitorsLogsRequestModel: visitorsLogsParams);
  }
 
  @override
  Future<CustomResponseType<BaseEntity<List<VisitorsLogsHostsEntity>>>> getVisitorLogsHosts({required String date}) async {
      return await visitorsLogsRemoteDataSource.getVisitorsHostsLogs(date: date);
}

  @override
  Future<CustomResponseType<bool>> getCanViewVisitorsLogs() async {
    return await visitorsLogsRemoteDataSource.getCanViewVisitorsLogs();
  } 
}


