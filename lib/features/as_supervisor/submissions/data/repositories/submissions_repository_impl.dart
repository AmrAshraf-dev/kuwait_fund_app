import 'package:injectable/injectable.dart';

import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../domain/repositories/submissions_repository.dart';
import '../data_sources/remote/submissions_remote_data_source.dart';
import '../models/request/submissions_request_model.dart';
import '../models/response/submissions_response_model.dart';

@Injectable(as: SubmissionsRepository)
class SubmissionsRepositoryImp implements SubmissionsRepository {
  SubmissionsRepositoryImp({
    required this.submissionsRemoteDataSource,
  });

  final SubmissionsRemoteDataSource submissionsRemoteDataSource;

  @override
  Future<CustomResponseType<BaseEntity<List<SubmissionsModel>>>> getSubmissions(
      {required SubmissionsRequestModel submissionsParams}) async {
    return await submissionsRemoteDataSource.getSubmissions(
        submissionsRequestModel: submissionsParams);
  }
}
