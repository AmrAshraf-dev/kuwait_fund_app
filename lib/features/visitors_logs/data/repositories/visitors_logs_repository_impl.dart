


import 'package:injectable/injectable.dart';

import '../../../../core/network/base_handling.dart';
import '../../../shared/entity/base_entity.dart';
import '../../domain/repositories/visitors_logs_repository.dart';
import '../models/request/visitors_logs_request_model.dart';
import '../models/response/visitors_logs_response_model.dart';
import '../../../visitors_logs/data/data_sources/remote/visitors_logs_remote_data_source.dart';

@Injectable(as: VisitorsLogsRepository)
class VisitorsLogsRepositoryImp implements VisitorsLogsRepository {
  VisitorsLogsRepositoryImp({
    required this.visitorsLogsRemoteDataSource,
  });

  final VisitorsLogsRemoteDataSource visitorsLogsRemoteDataSource;

  Future<CustomResponseType<BaseEntity<VisitorsLogsModel>>> getVisitorsLogs(
      {required VisitorsLogsRequestModel visitorsLogsParams}) async {
    return await visitorsLogsRemoteDataSource.getVisitorsLogs(
        visitorsLogsRequestModel: visitorsLogsParams);
  }
}


