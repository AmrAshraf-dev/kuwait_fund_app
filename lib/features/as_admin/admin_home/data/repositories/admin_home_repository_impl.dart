import 'package:injectable/injectable.dart';

import '../../../../../core/network/base_handling.dart';
import '../../../../shared/entity/base_entity.dart';
import '../../domain/repositories/admin_home_repository.dart';
import '../data_sources/remote/admin_home_remote_data_source.dart';
import '../models/request/admin_home_request_model.dart';
import '../models/response/admin_home_response_model.dart';

@Injectable(as: AdminHomeRepository)
class AdminHomeRepositoryImp implements AdminHomeRepository {
  AdminHomeRepositoryImp({
    required this.adminHomeRemoteDataSource,
  });

  final AdminHomeRemoteDataSource adminHomeRemoteDataSource;

  Future<CustomResponseType<BaseEntity<AdminHomeModel>>> getAdminHome(
      {required AdminHomeRequestModel adminHomeParams}) async {
    return await adminHomeRemoteDataSource.getAdminHome(
        adminHomeRequestModel: adminHomeParams);
  }
}
